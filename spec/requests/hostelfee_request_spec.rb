require 'rails_helper'

RSpec.describe "Hostelfees", type: :request do
include Warden::Test::Helpers


  describe 'POST hostelfee#new' do
  	

  	it 'check paid or not going inside else' do	
  		user=create(:user)
  	login_as(user)
  		fee=create(:hostelfee,user_id:user.id)
  		get '/student/'+user.id.to_s+'/hostelfee/new'
  		expect(response).to have_http_status(:success)
  	end  

  	it 'check paid or not going inside if length==0' do
  		user=create(:user)
  		login_as(user)
  		get '/student/'+user.id.to_s+'/hostelfee/new'
  		expect(response).to have_http_status(:success)
  	end

  	it 'check paid or not with current year' do
  		user=create(:user)
  		fee=create(:hostelfee,user_id:user.id,year:Date.today.year)
  		login_as(user)
  		get '/student/'+user.id.to_s+'/hostelfee/new'
  		expect(response).to redirect_to student_hostelfee_index_path
  	end  
  end

  describe "hostelfee#show" do
  	it "call show" do
  		user=create(:user)
  		fee=create(:hostelfee,user_id:user.id,year:Date.today.year)
  		login_as(user)
  		get '/student/'+user.id.to_s+'/hostelfee/'+fee.id.to_s
  		expect(response).to have_http_status(:success)
  	end
  end
end
