class LeaveMailMailer < ApplicationMailer
	
	def sendLeaveApplication(leave)
		@leaveApplication=leave
		mail(to: 'rgpatel7714@gmail.com',subject: 'Confirmation Mail For Leave')
	end
end
