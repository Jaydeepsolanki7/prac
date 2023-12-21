# app/admin/email_histories.rb
ActiveAdmin.register EmailHistory do

  index do
    selectable_column
    id_column
    column :post
    column :post_type do |email_history|
      email_history.post.post_type
    end
    column :post_title do |email_history|
      email_history.post.title
    end
    column :post_description do |email_history|
      email_history.post.description
    end
    column :email
    column :created_at
    actions
  end


  filter :post
  filter :email

end
