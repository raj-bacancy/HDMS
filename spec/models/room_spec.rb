require 'rails_helper'

RSpec.describe Room, type: :model do
  it 'call room model :)' do 
  	@room=create(:room)
  end
end
