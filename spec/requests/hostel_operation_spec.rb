require 'rails_helper'

RSpec.describe "HostelOperations", type: :request do
  include Warden::Test::Helpers
 

  before do
    login_as(create(:user), scope: :user)
  end


  describe "hostel_operation#new" do
    it 'call index with role != owner' do
    	get '/'
    	expect(response).to redirect_to student_index_path
    end

    it 'call index with role == owner' do
    	user=create(:user,role:'owner')
    	login_as(user)
    	get '/'
    	expect(response).to redirect_to owner_index_path
    end
  end


end
