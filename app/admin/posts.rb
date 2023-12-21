ActiveAdmin.register Post do
  skip_before_action :verify_authenticity_token
  menu priority: -1
  config.clear_action_items!

  action_item :index, only: :index do
    link_to 'New Post', new_admin_post_path
  end
  
  permit_params :title, :description, :post_type, :image, photos: [], reviews_attributes: [:id, :body, :_destroy], email_histories_attributes: [:id, :email, :_destroy]
  filter :title

  after_create do |post|
    Post.transaction do
      post.save!
      PostMailer.post_created_notification(post).deliver_later
    end
  rescue ActiveRecord::RecordInvalid => e
    Rails.logger.error("Error saving post: #{e.message}")
  end

  form do |f|
    f.inputs "Post Details" do
      f.input :title
      f.input :description
      f.input :post_type, as: :select, collection: Post.post_types.keys, include_blank: false
      f.input :image, as: :file, label: "Image", hint: 'Should be smaller than 2097152 bytes'
      f.input :photos, as: :file, input_html: { multiple: true }, label: "Photos", hint: 'Multiple photos can be uploaded'

      f.has_many :reviews, heading: 'Reviews', allow_destroy: true do |r|
        r.input :body
      end
    end

    f.actions
  end
  

  index do
    selectable_column
    id_column
    column :post_type
    column :title
    column :description
    actions
    column 'All Reviews' do |post|
      link_to 'All Reviews', admin_reviews_path(q: { post_id_eq: post.id })
    end
  end

  show do |post|
    attributes_table do
      row :post_type
      row :title
      row :description
      row :image do |post|
        if post.image.attached?
          image_tag url_for(post.image), height: '200'
        else
          'No image attached'
        end
      end
      row :photos do |post|
        if post.photos.attached?
          post.photos.each do |photo|
            image_tag url_for(photo), height: "200"
          end
        else
          'No image attached'
        end
      end   
    end

    panel "Reviews" do
      table_for post.reviews do
        column :body
      end
    end
  end

  controller do
    def create
      super do |format|
        flash[:notice] = "Post was successfully created." if resource.valid?
      end
    end

    def update
      super do |format|
        flash[:notice] = "Post was successfully updated by mine." if resource.valid?
      end
    end
  end

  action_item :import_csv, only: :index do
    link_to 'Import CSV', action: :import_csv
  end

  collection_action :import_csv do
    render 'admin/posts/_import_csv'
  end
  
  collection_action :process_csv, method: :post do
    Post.import_csv(params[:file])
    redirect_to admin_posts_path, notice: 'CSV imported successfully!'
  end

  action_item :export_to_pdf, only: :index do
    link_to 'Export to PDF', export_to_pdf_admin_posts_path(format: :pdf)
  end

  collection_action :export_to_pdf, method: :get do
    posts = Post.all
    pdf = Prawn::Document.new
    pdf.text 'Posts Report', align: :center, size: 16
    pdf.move_down 20

    posts.each do |post|
      pdf.text "Title: #{post.title}", size: 14, style: :bold
      pdf.text "Description: #{post.description}"
      pdf.move_down 10
    end
    send_data pdf.render, filename: "posts_report.pdf", type: "application/pdf", disposition: 'inline'
  end
end
