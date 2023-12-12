require 'rails_helper'

RSpec.describe AdminUser, type: :model do
  describe "validates factory" do
    it "validates the factory" do
      expect(build(:admin_user)).to be_valid
    end
  end
end
