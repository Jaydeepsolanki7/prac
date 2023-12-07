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
    actions
  end

  filter :title
end
