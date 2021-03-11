class OwnerController < ApplicationController
    def index
         @owner=User.find_by(role:'owner')
         @total_rooms=Room.all.size
         @total_capacity=Room.sum('capacity');
         @total_vacancy=Room.sum('vacancy');
     end

    # def new
    #     @user=User.new
    # end

    # def index
    #     @owner=Hosteler.find_by(role:'owner')
    #     @total_rooms=Room.all.size
    #     @total_capacity=Room.sum('capacity');
    #     @total_vacancy=Room.sum('vacancy');
    # end

    def new
        @user=User.new
    end

     def create    
         @user=User.new(get_paramas)
         @room=Room.find_by(room_no:@user.room_no)
         if @room==nil
             flash[:notice]='Room does not exist'
             redirect_to new_owner_path
         elsif @room.vacancy==0
             flash[:notice]='Not enough space in this room'
             redirect_to new_owner_path
         elsif @user.save
         	@room.vacancy=@room.vacancy-1
         	@room.save
             index
             render 'index'
         else
             render 'new'
         end
     end
    
    # def create    
    #     @user=Hosteler.new(get_paramas)
    #     @room=Room.find_by(room_no:@user.room_no)
    #     @room.vacancy=@room.vacancy-1
    #     if @room==nil
    #         flash[:notice]='Room does not exist'
    #     elsif @room.vacancy<0
    #         flash[:notice]='Not enough space in this room'
    #         redirect_to new_owner_path
    #     elsif @user.save && @room.save
    #         index
    #         render 'index'
    #     else
    #         render 'new'
    #     end
    # end
     def get_paramas
         params.require(:user).permit(:firstname,:lastname,:email,:phoneno,:username,:password,:role,:hostel_id,:room_no)
     end

    # def get_paramas
    #     params.require(:hosteler).permit(:firstname,:lastname,:email,:phoneno,:username,:password,:role,:hostel_id,:room_no)
    # end

    def all_request  
        @no_of_leave=Leave.where(status:'Pending').size
    end
end
