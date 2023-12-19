ActiveAdmin.register CatalogueAmenity do
  menu false

  permit_params :catalogue_id, :amenity_id, :name
end
