require 'rails_helper'

RSpec.describe PostMailer, type: :mailer do
  let(:post) { create(:post) } # Using the post factory

  describe '#post_created_notification' do
    let(:mail) { PostMailer.post_created_notification(post) }

    it 'renders the headers' do
      expect(mail.subject).to eq('New Post Created')
      expect(mail.to).to eq(['jay.solanki7694@gmail.com'])
      expect(mail.from).to eq(['jasolanki@bestpeers.in']) 
    end


    it 'renders the body' do
      expect(mail.body.encoded).to include('New Post Created')
      expect(mail.body.encoded).to include("Title: #{post.title}")
      expect(mail.body.encoded).to include("Description: #{post.description}")
      expect(mail.body.encoded).to include("Post Type: #{post.post_type}")
    end


    it 'includes the post image as an inline attachment' do

      if mail.parts.present? && !mail.parts.empty?
        expect(mail.parts[0].body.to_s).to include('post_image.png') if post.image.attached?
      else
        expect(mail.body.to_s).to include('post_image.png') if post.image.attached?
      end
    end
  end
end
