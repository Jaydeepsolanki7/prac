require "rails_helper"

RSpec.describe UserMailer, type: :mailer do
  let(:user) {create(:user)}
  describe "#welcome_email" do
    let(:mail) { UserMailer.welcome_email(user)}

    it "render the header" do
      expect(mail.subject).to eq("Welcome to my app")
      expect(mail.from) == ('jasolanki@bestpeers.in')
      expect(mail.to) == ("#{user.email}")
    end

    it "render the body" do
      expect(mail.body.encoded).to include("Welcome to My App, #{user.email}")
    end
  end

  describe "#morning_greeting_email" do
    let(:mail) {UserMailer.morning_greeting_email(user) }

    it "render the header" do
      expect(mail.subject).to eq('How are you feeling today?')
      expect(mail.from) == ('jasolanki@bestpeers.in')
      expect(mail.to) == ("#{user.email}")
    end

    it "render the body" do
      expect(mail.body.encoded).to include("Good Morning!")
    end
  end
end

