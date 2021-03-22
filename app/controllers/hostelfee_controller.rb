class HostelfeeController < ApplicationController

	def new 	
		# begin
			if current_user.hostelfee.length==0
				@hostelfee=Hostelfee.new
			elsif current_user.hostelfee[0].year.to_i==Date.today.year
				flash[:notice]='Fee Already Paid'
				redirect_to student_hostelfee_index_path(current_user.id)
			else
				@hostelfee=Hostelfee.new
			end
		 # rescue
		 # 	flash[:notice]='Something Wrong'
		 # 	redirect_to student_hostelfee_index_path(current_user.id)
		 # end
	end

	def show
		@hostelfee=current_user.hostelfee
	end
end
