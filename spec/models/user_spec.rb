require 'rails_helper'

describe User do
  context "when the user is created" do

    it "is not valid without an email" do
      expect(User.new(password: "password")).not_to be_valid
    end

  end

end
