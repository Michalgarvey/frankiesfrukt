require 'rails_helper'

describe Comment do
  context "when the comment is created" do

    let (:comment) { Comment.create!( body: "Delicious - so juicy!") }

    it "is not valid without a rating" do
      expect(Comment.new(body: "Delicious - so juicy!")).not_to be_valid
    end

  end

end
