require 'rails_helper'

RSpec.describe User, :type => :model do
	  let(:user) { create(:user) }

	  describe "is invalid without a" do
	    it "name" do
	      user.name = nil
	      expect(user).to be_invalid
	    end

	    it "email" do
	      user.email = nil
	      expect(user).to be_invalid
	    end

	    it "password" do
	      user.password = nil
	      expect(user).to be_invalid
	    end

	    it "birthday" do
	      user.birthday = nil
	      expect(user).to be_invalid
	    end
	end
end
