require 'rails_helper'

describe Product do
  context "when the product has comments" do

    let (:product) { Product.create!(name: "passionfruit", image_url: "http://finedininglovers.cdn.crosscast-system.com/BlogPost/xl_15715_Passion-fruit-TP.jpg", description: "Juicy little seeds", price: "45" ) }
    let (:user) { User.create!(email: "michalgarvey@gmail.com", password: "password") }

    before do
      product.comments.create!(rating: 5, user: user, body: "Delicious!")
      product.comments.create!(rating: 3, user: user, body: "So so.")
      product.comments.create!(rating: 1, user: user, body: "Gross!")
    end

    it "returns the averate rating of all comments" do
      expect(product.average_rating).to eq 3
    end

    it "is not valid without a name" do
      expect(Product.new(description: "Yummy!")).not_to be_valid
    end

  end

end
