ActiveAdmin.register Amenity do
  permit_params :name

  filter :name
  form do |f|
    f.inputs do
      f.input :name
    end
    f.actions
  end

  index do
    selectable_column 
    id_column 
    column :name
    actions
  end
end
