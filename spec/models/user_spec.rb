require 'rails_helper'

RSpec.describe User, type: :model do
  before(:all) do
    @user = create(:user)
    @user1 = create(:user,role:'owner')
    @user1.update(firstname:'raj')
    
  end

  it "call model :)" do
  end
end