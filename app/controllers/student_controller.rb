class StudentController < ApplicationController
    def index
         @user=User.find(current_user.id)
         @room_members=User.where(room_no:@user.room_no)
         @total_rooms=Room.all.size
         @total_capacity=Room.sum('capacity');
         @total_vacancy=Room.sum('vacancy');
     end

    # def index
    #     @user=Hosteler.find(current_hosteler.id)
    #     @room_members=User.where(room_no:@user.room_no)
    #     @total_rooms=Room.all.size
    #     @total_capacity=Room.sum('capacity');
    #     @total_vacancy=Room.sum('vacancy');
    # end
end
