require 'rails_helper'

RSpec.describe "Owners", type: :request do
	include Warden::Test::Helpers
 

  before do
    login_as(create(:user), scope: :user)
  end

	describe "GET /new" do
    
    it 'call new of owner_controller' do
    	get '/owner/new'
    	expect(response).to have_http_status(:success)
    end

  end

  describe 'GET owner#index' do
    context 'Get Owner And All Hostel Information' do
      it 'Get index' do
        get '/owner'
        expect(response).to render_template :index
      end
    end
  end

  describe 'POST owner#create' do
    context 'with valid params' do
      let(:user) do 	
        post '/owner', params: {
	     user: attributes_for(:user,room_no:create(:room).room_no)
	    }
      end
      it { expect { user }.to change(User, :count).by(1) }
    end

	context 'with null room' do
      let(:user) do 	
        post '/owner', params: {
	     user: attributes_for(:user)
	    }
      end

      it { expect { user }.not_to change(User, :count) }
      
    end

    context 'with Zero Vacancy room' do
      let(:user) do 	
        post '/owner', params: {
	     user: attributes_for(:user,room_no:create(:room,capacity:0).room_no)
	    }
      end

      it { expect { user }.not_to change(User, :count) }
      
    end

    context 'In Student Profile' do
      it "Find Profilr of student" 	do
      	user=create(:user)
        get '/owner/student_profile?id='+user.id.to_s
        expect(response).to render_template :student_profile
      end
    end

    context 'In all request' do
      it "getting number of requests" 	do
        leave=create(:leave,user_id:create(:user).id)
        get '/owner/all_request'
        expect(response).to render_template :all_request
      end
    end

  end

end
