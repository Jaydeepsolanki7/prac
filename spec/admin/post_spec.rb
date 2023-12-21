# # spec/admin/posts_spec.rb
# require 'rails_helper'
# require 'support/active_admin_helpers'

# RSpec.describe 'Admin Post Management', type: :feature do
#   include ActiveAdminHelpers

#   let(:admin_user) { create(:admin_user) }

#   before do
#     login_as(admin_user, scope: :admin_user)
#   end

#   describe 'Posts CRUD operations' do
#     it 'creates a new post' do
#       visit admin_posts_path
#       click_link 'New Post'

#       fill_in 'Title', with: 'Test Post'
#       fill_in 'Description', with: 'Test Description'
#       fill_in 'Post type', with: 'Test Type'
#       # Fill in other required fields as needed

#       click_button 'Create Post'

#       expect(page).to have_content('Post was successfully created.')
#     end

#     it 'edits an existing post' do
#       post = create(:post)

#       visit admin_post_path(post)
#       click_link 'Edit Post'

#       fill_in 'Title', with: 'Updated Title'
#       # Update other fields as needed

#       click_button 'Update Post'

#       expect(page).to have_content('Post was successfully updated by mine.')
#     end

#     it 'deletes an existing post' do
#       post = create(:post)

#       visit admin_posts_path
#       click_link "Delete #{post.id}"

#       expect(page).to have_content('Post was successfully destroyed.')
#     end
#   end

#   describe 'CSV import' do
#     it 'imports CSV successfully' do
#       visit admin_posts_path
#       click_link 'Import CSV'

#       attach_file 'file', Rails.root.join('path/to/your/test.csv')
#       click_button 'Import CSV'

#       expect(page).to have_content('CSV imported successfully!')
#     end
#   end

#   describe 'PDF export' do
#     it 'exports to PDF successfully' do
#       visit admin_posts_path
#       click_link 'Export to PDF'

#       # Add expectations for the exported PDF
#       # For example, you can check if the PDF content matches your expectations
#     end
#   end
# end
