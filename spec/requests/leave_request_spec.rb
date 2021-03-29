require 'rails_helper'

RSpec.describe "Leaves", type: :request do
include Warden::Test::Helpers
	
	describe "leave#new" do
		it "calling new" do
			user=create(:user)
			login_as(user)
			get '/student/'+user.id.to_s+'/leave/new'
			expect(response).to have_http_status(:success)
		end
	end
#/student/:student_id/leave/:id
	describe 'POST leave#create' do
	    context 'with valid params' do
	      let(:leave) do 	
	      	user=create(:user)
     		login_as(user)
	        post '/student/'+user.id.to_s+'/leave',params: {
		     leave: attributes_for(:leave,user_id:user.id)
		    }
	      end
		  
		  it { expect { leave }.to change(Leave, :count).by(1) }
	    end
	end

	describe 'POST leave#show' do
	    it 'calling show' do
	      	user=create(:user)
     		login_as(user)
     		leave=create(:leave,user_id:user.id)
	        get '/student/'+user.id.to_s+'/leave/'+leave.id.to_s+'?student_id='+user.id.to_s
	      expect(response).to have_http_status(:success)
	    end
	end

	describe 'get leave#show_owner' do
	    it 'getting owner information' do
	      	user=create(:user,role:'owner')
     		login_as(user)
     		leave=create(:leave,user_id:user.id)
	        get '/leave/show_owner'
	      expect(response).to have_http_status(:success)
	    end
	end

	describe 'put leave#update' do
	    it 'approve leave and send mail' do
	      	user=create(:user,role:'owner')
     		login_as(user)
     		leave=create(:leave,user_id:user.id)
	        put '/student/'+user.id.to_s+'/leave/'+leave.id.to_s+'?flag=approve'
	      	expect(response).to redirect_to leave_show_owner_path
	    end

	    it 'reject leave' do
	      	user=create(:user,role:'owner')
     		login_as(user)
     		leave=create(:leave,user_id:user.id)
	        put '/student/'+user.id.to_s+'/leave/'+leave.id.to_s+'?flag=reject'
	      	expect(response).to redirect_to leave_show_owner_path
	    end
	end


end
