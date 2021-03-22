class User < ApplicationRecord
	
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :leave
  has_many :hostelfee
  has_one_attached :ProfilePic

    before_create :add_role

    def add_role
        if self.role==nil
            self.role='student'          
        else
            self.room_no='0'
        end
    end

    before_update :change_status

    def change_status
        self.status=true
    end
end
