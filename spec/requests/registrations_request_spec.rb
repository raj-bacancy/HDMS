require 'rails_helper'

RSpec.describe "Registrations", type: :request do
    include Warden::Test::Helpers

    describe "get Registration#new" do
        it "create new user" do
            get "/users/sign_up"
            expect(response).to have_http_status(:success)
        end
    end

    describe "Post Registration#create" do
        context "save user with role=owner" do 
            let(:user) do
                post '/users',params:{ user:attributes_for(:user,role:'owner')}
            end
            it { expect { user }.to change(User, :count).by(1) }
        end

        context "save user with role=student" do 
            let(:user) do
                post '/users',params:{ user:attributes_for(:user,role:'student')}
            end
            it { expect { user }.to change(User, :count).by(1) }
        end
    end

    describe "put Registration#update" do
        it "Update the user with role=owner" do
            user=create(:user)
            login_as(user)
            put '/users',params:{ user:attributes_for(:user,role:'owner')}
            expect(response).to redirect_to owner_index_path
        end

        it "Update the user with role=student" do
            user=create(:user)
            login_as(user)
            put '/users',params:{ user:attributes_for(:user,role:'student')}
            expect(response).to redirect_to student_index_path
        end
    end

    describe "get Registration#edit" do
        it "edit user" do
            user=create(:user)
            login_as(user)
            get "/users/edit"
            expect(response).to have_http_status(:success)
        end
    end

end
