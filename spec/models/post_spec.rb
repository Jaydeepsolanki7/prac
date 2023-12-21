require 'rails_helper'

RSpec.describe Post, type: :model do
  it { should validate_uniqueness_of(:title).case_insensitive } 
  it { should have_many(:reviews) }
  it { should have_many(:email_histories) }
  it { should validate_presence_of(:post_type) }

  describe "validates factory" do
    it "should validates factory" do
      expect(build(:post)).to be_valid
    end
  end

  describe "perform after save" do
    @post = FactoryBot.create(:post)
    it "should work as expected" do
    end
  end

  let(:post) { create(:post) }  # Assuming you have a Post factory

  it 'creates an EmailHistory associated with the post' do
    expect {
      post.create_email_history
    }.to change(EmailHistory, :count).by(2)

    email_history = EmailHistory.last
    expect(email_history.post).to eq(post)
    expect(email_history.email).to eq('jay.solanki7694@gmail.com')
  end

  it "triggers do_something on save" do
    @post = FactoryBot.create(:post)
    expect(@post).to receive(:perform_after_save)
    @post.save
  end

  it "triggers do_something on save" do
    @post = FactoryBot.create(:post)
    expect(@post).to receive(:perform_after_commit)
    @post.save
  end
end
