class OwnerController < ApplicationController
    def index
         @owner=User.find_by(role:'owner')
         @total_rooms=Room.all.size
         @total_capacity=Room.sum('capacity');
         @total_vacancy=Room.sum('vacancy');
     end

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
         elsif @user.save(validate: false)
         	@room.vacancy=@room.vacancy-1
         	@room.save
             index
             render 'index'
         else
            flash[:notice]='Something went wrong'
             render 'new'
         end
     end
    
    def student_profile
        @user=User.find(params[:id])
    end
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
