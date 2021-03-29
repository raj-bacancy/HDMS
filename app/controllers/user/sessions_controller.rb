# frozen_string_literal: true

class User::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
   def new
     @user=User.new
   end

  # POST /resource/sign_in
   def create
     @user=current_user
      if @user.blank?
           redirect_to hostel_operation_index_path
         else
             if @user.role=='student'
                 if @user.status
                     redirect_to student_index_path
                 else
                  #render '/devise/registrations/edit'
                     redirect_to edit_user_registration_path
                 end
                
             else
                 redirect_to owner_index_path
             end
         end

   end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
