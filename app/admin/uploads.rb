ActiveAdmin.register Upload do
  permit_params :title, tips_attributes: [:id, :name, :_destroy]

  filter :title

  form do |f|
    f.inputs do
      f.input :title

      f.inputs "Tips" do
        f.has_many :tips, heading: false , allow_destroy: true do |c|
          c.object ||= Tip.new
          c.input :name
        end
      end
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
