require 'rails_helper'

describe ProductsController, type: :controller do

  context 'GET #index' do
    it 'renders the index page for products' do
      get :index
      expect(response).to be_ok
      expect(response).to render_template('index')

    end
  end

  context 'GET #new' do
    it 'renders the new template for products' do
      get :new
      expect(response).to be_ok
      expect(response).to render_template('new')
    end
  end


  context 'DELETE #destroy' do
    before do
      @product = Product.create(name: "test", description: "test", price: 30)
    end
    it 'deletes the product and redirects to products' do
      delete :destroy, params: { id: @product.id }
      expect(response).to redirect_to products_path
    end
  end






end
