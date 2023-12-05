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
end
