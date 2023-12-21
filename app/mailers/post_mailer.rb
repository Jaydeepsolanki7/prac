# app/mailers/post_mailer.rb
class PostMailer < ApplicationMailer
  def post_created_notification(post)
    @post = post
    if @post.image.attached? && @post.image.service.exist?(@post.image.key)
      attachments.inline['post_image.png'] = @post.image.download
    end
    mail(to: 'jay.solanki7694@gmail.com', subject: 'New Post Created')
  end
end
