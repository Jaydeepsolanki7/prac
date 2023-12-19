require 'rails_helper'

RSpec.describe Post, type: :model do
  it { should validate_uniqueness_of(:title).case_insensitive } 
  it { should have_many(:reviews) }
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
