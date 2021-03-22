require 'rails_helper'

RSpec.describe "RoomManagements", type: :request do
include Warden::Test::Helpers

	describe "room_management#show" do
		it 'show all user from perticular room' do 
			user=create(:user,role:'owner',room_no:create(:room).room_no)
			login_as(user)
			get '/room_management/'+user.room_no.to_s
			expect(response).to have_http_status(:success)
		end
	end

	describe "room_management#get_all_room" do
		it 'get all the rooms' do 
			user=create(:user,role:'owner')
			login_as(user)
			get '/room_management/get_all_room'
			expect(response).to have_http_status(:success)
		end
	end

	describe "room_management#new" do
		it 'create new room' do 
			user=create(:user,role:'owner')
			login_as(user)
			get '/room_management/new'
			expect(response).to have_http_status(:success)
		end
	end

	describe 'room_management#create' do
	    context 'with valid params' do
	      let(:room) do 	
	        post '/room_management', params: {
		     room: attributes_for(:room)
		    }
	      end
	    end
	end
end
