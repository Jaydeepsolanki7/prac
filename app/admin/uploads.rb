ActiveAdmin.register Upload do
  permit_params :title, :file
  form do |f|
    f.inputs "category form" do
      f.input :title
      f.input :file, as: :file, input_html: { accept: '.csv' }
    end
    f.actions
  end

  index do
    selectable_column
    id_column
    column :title
    column :file do |upload|
      if upload.file.attached?
        link_to 'Download', rails_blob_path(upload.file, disposition: 'attachment')
      else
        'No File Attached'
      end
    end
    actions
  end

  filter :title
end
