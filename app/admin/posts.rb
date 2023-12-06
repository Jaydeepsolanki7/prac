ActiveAdmin.register Post do
  permit_params :title, :description

  filter :title

  form do |f|
    f.inputs do
      f.input :title
      f.input :description
    end
    f.actions
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
end
