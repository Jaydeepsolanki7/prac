ActiveAdmin.register Catalogue do
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
