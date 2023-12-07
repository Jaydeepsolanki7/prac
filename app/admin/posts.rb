ActiveAdmin.register Post do
  permit_params :title, :description, reviews_attributes: [:id, :body, :_destroy]

  filter :title

  form do |f|
    f.inputs do
      f.input :title
      f.input :description

      f.inputs "Reviews" do
        f.has_many :reviews, heading: false , allow_destroy: true do |c|
          c.object ||= Review.new
          c.input :body
        end
      end
    end
    f.actions
  end

  show do |post|
    attributes_table do
      row :title
      row :description
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

    def destroy
      super do |format|
        flash[:notice] = "Post was successfully deleted by mine." if resource.valid?
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
