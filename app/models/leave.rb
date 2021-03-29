class Leave < ApplicationRecord
	 belongs_to :user
	 validates :subject,:reason,:date_from,:date_to, presence:true
end
