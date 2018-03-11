require 'rails_helper'

describe ProductsController, type: :controller do

  context 'GET #index' do
    it 'renders the index page for products' do
      get :index
      expect(response).to be_ok
      expect(response).to render_template('index')

    end
  end

  context 'GET #show' do
    before do
      @product = FactoryBot.create(:product)
    end
    it 'renders the product show page' do
      get :show, params: { id: @product.id }
      expect(response).to be_ok
      expect(response).to render_template('show')
    end
  end

  context 'GET #new' do
    it 'renders the new template for products' do
      get :new
      expect(response).to be_ok
      expect(response).to render_template('new')
    end
  end

  context 'GET #edit' do
    before do
      @product = FactoryBot.create(:product)
    end
    it 'renders the edit tempate for products' do
      get :edit, params: { id: @product.id }
      expect(response).to be_ok
      expect(response).to render_template('edit')
    end
  end

  context 'POST #create' do
    before do
      @user = FactoryBot.create(:user)
    end
    it 'creates a new product and redirects to the products path' do
      @product = FactoryBot.create(:product)
      post :create, params: { product: { name: @product.name, description: @product.description, image_url: @product.image_url, price: @product.price } }
      expect(response).to redirect_to products_path
    end
  end

  context 'POST #update' do
    before do
      @product = FactoryBot.create(:product)
    end
    it 'updates the product information' do
      @update = { name: 'newtestname'}
      post :update, params: { id: @product.id, product: @update }
      @product.reload
      expect(@product.name).to eq 'newtestname'
    end
  end

  context 'DELETE #destroy' do
    before do
      @product = FactoryBot.create(:product)
    end
    it 'deletes the product and redirects to products' do
      delete :destroy, params: { id: @product.id }
      expect(response).to redirect_to products_path
    end
  end







end
