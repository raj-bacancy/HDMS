class HostelOperationController < ApplicationController
 
 # def devise_index

 #        @hosteler=User.last
 #        @user=User.last
 #        @role=@hosteler.role

 #            if @role=='student'
 #                if @hosteler.status
 #                    redirect_to student_index_path
 #                else
 #                    redirect_to edit_hostel_operation_path(@hosteler.id)
 #                end 
 #            else
 #                redirect_to owner_index_path
 #            end
 #    end

    def index
        if current_user.role=="owner"
         redirect_to owner_index_path
        else
         redirect_to student_index_path
        end
        #@user=User.new
    end

    # def new
    #     @user=User.new
    # end
  
    # def create
    #     byebug
    #    @user=User.new(get_paramas)
    #    @user.save
    
    #    index
    #    render 'index'
    # end

    # def edit
    #     @user=User.find_by_id(params[:id]);
    # end
    
    # def update
    #     @user=Hosteler.find(params[:id])
    #     @user.status=true
    #     @user.update(get_paramas)
    #     session[:HostelId]=@user.id
    #     redirect_to student_index_path
    # end

    # def check_auth
    #     @username=params[:user][:username]
    #     @password=params[:user][:password]
    #     @role=params[:user][:role]
    #     @user=User.where(username:@username,password:@password,role:@role)
    #     if @user.blank?
    #         index()
    #         render 'index'
    #     else
    #         if @user[0].role=='student'
    #             if @user[0].status
    #                 session[:HostelId]=@user[0].id
    #                 redirect_to student_index_path
    #             else
    #                 redirect_to edit_hostel_operation_path(@user[0].id)
                    
    #             end
                
    #         else
    #             redirect_to owner_index_path
    #         end
    #     end
    # end

    # def get_paramas
    #     params.require(:user).permit(:firstname,:lastname,:email,:phoneno,:username,:password,:role,:status,:room_no)
    # end
end
