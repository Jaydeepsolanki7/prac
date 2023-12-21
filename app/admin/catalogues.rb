ActiveAdmin.register Catalogue do
  menu false
  permit_params :name, :catalogue_image

  filter :name

  form do |f|
    f.inputs do
      f.input :name
      f.input :catalogue_image, as: :file
    end
    f.actions
  end

  index do
    selectable_column
    id_column
    column :name
    actions
  end

  show do |catalogue|
    attributes_table do
      row :name
    end
    panel "Ameneties" do
      table_for catalogue.amenities do
        column :name
      end
    end
  end
end
