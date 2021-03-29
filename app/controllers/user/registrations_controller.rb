# frozen_string_literal: true

class User::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
   def new
     @user=User.new
  end

  # POST /resource
     def create
      @user1=User.where(role:'owner')
      @user=User.new(get_params)
      if @user1[0].blank?
        if @user.save
          flash[:SuccessfullyCreated]='Account Created Successfully Now you can log in'
          redirect_to new_user_session_path
        else
          render 'new'
        end
      else
        flash[:OwnerExist]='Owner is already exist you can not create another owner'
        redirect_to new_user_registration_path
      end
      #  if @user.role=='owner'
      #     redirect_to owner_index_path
      #   else
      #     redirect_to student_index_path
      #   end      
     end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
   def update
     @user=User.find(current_user.id)
     if @user.update(get_params)
      redirect_to root_path
     else
      render 'edit'
     end
   end

   def edit
      @user=current_user
   end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
   def configure_sign_up_params
     devise_parameter_sanitizer.permit(:sign_up, keys: [:firstname,:lastname,:email,:role,:phoneno,:room_no,:password])
   end

   def get_params
        params.require(:user).permit(:firstname,:lastname,:email,:role,:phoneno,:room_no,:password,:status,:address,:password_confirmation,:ProfilePic)
    end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
