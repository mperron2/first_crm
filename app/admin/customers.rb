ActiveAdmin.register Customer do
  permit_params :full_name, :phone_number, :email_address, :notes, :image

  remove_filter :image_attachment, :image_blob

  form do |f|
    f.semantic_errors
    f.inputs do
      f.input :full_name
      f.input :phone_number
      f.input :email_address
      f.input :notes
      f.input :image, as: :file, hint: f.object.image.present? ? image_tag(f.object.image) : ""
    end
    f.actions
  end

  index do
    selectable_column
    id_column
    column :full_name
    column :phone_number
    column :email_address
    column :notes
    column :created_at
    column :updated_at
    actions
  end

  filter :full_name
  filter :phone_number
  filter :email_address
  filter :notes
  filter :created_at
  filter :updated_at
end
