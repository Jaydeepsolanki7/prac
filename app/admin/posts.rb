ActiveAdmin.register Post do

  index do
    selectable_column
    id_column
    column :title
    column :description
    column :created_at
    actions
  end

  filter :title
  filter :description
end
