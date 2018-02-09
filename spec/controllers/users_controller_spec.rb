require 'rails_helper'

describe UsersController, type: :controller do
  before do
    @user = User.create!(email: "test@test.com", password: "password")
    @user2 = User.create!(email: "2test@test.com", password: "2password")
  end

    describe 'GET #show' do

      context 'when a user is logged in' do
        before do

          it 'loads correct user details' do

            expect(response).to have_http_status(200)
            expect(assigns(:user)).to eq @user
          end
        end
      end


      context 'when a user is not logged in' do
        it 'redirects to login' do
          get :show, params: { id: @user.id }
          expect(response).to redirect_to(new_user_session_path)
        end
      end

      context 'User cannot access user2s details' do
        it 'loads correct user details' do
          get :show, params: { id: @user2.id }
          expect(response).to redirect_to(new_user_session_path)

        end
      end
    end

end
