class Room < ApplicationRecord
	has_many :user
    self.primary_key='room_no'
    validates :room_no, uniqueness:true
    validates :capacity,numericality:{only_integer:true}
    validates :room_no,:capacity, presence: true

    before_create :add_vacancy

    def add_vacancy
        self.vacancy=self.capacity
    end
end
