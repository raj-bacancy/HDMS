class LeaveController < ApplicationController
     def index
    end

    def new
        @user=User.find(current_user.id)
        @leave=Leave.new
    end

    def create
        if current_user.id!=nil
            @leave=Leave.new(get_params)
            @leave.user_id=current_user.id
            if @leave.save
                redirect_to student_leave_index_path(current_user.id)
            else
                redirect_to student_leave_index_path(current_user.id)
            end
        else
            puts 'Session Khatam'
            redirect_to student_leave_index_path(current_user.id)
        end
    end

    def show
        if current_user.id!=nil
            @user=User.find(params[:student_id])
            @leaves=@user.leave
        end        

             
    end

    def show_owner 
        if current_user.id!=nil
            @all_leave=Leave.where(status:'Pending')
        end        
    end

    def update
        if params[:flag]=='approve'
            @leave=Leave.find(params[:id])
            @leave.status='Approved'
            @leave.save
        elsif params[:flag]=='reject'
            @leave=Leave.find(params[:id])
            @leave.status='Rejected'
            @leave.save
        end
        redirect_to leave_show_owner_path
    end
    

    def get_params
        params.require(:leave).permit(:user_id,:reason,:subject,:date_to,:date_from,:status)
    end
end
