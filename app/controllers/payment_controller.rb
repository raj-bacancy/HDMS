class PaymentController < ApplicationController
	include HTTParty
	require 'json'

	def create
		cardnumber=params[:cardnumber]
		exp_month=params[:month]
		exp_year=params[:year]
		cvv=params[:cvv]
    	@SecretKey="sk_test_51IKcX5JvMhB28Qnk9fMHc1ws88pz34plPnwmGccDPSu9hvo7BHzCeTPaPDUdBWWQY9nwdSJiIh42JzeZLGcnkyeH00RLKjqlup";
		@result = HTTParty.post('https://api.stripe.com/v1/tokens', 
    :body => { 'card[number]' => cardnumber, 
               'card[exp_month]' => exp_month, 
               'card[exp_year]' => exp_year, 
               'card[cvc]' => cvv
             },
    :headers => { 
    			  'Content-Type' => 'application/x-www-form-urlencoded',
    			  'Authorization' => 'Bearer '+@SecretKey } )
		@token_id=JSON.parse(@result.to_json)['id'];
	if @token_id!=nil
		pay(@token_id)
		@hostelfee=current_user.hostelfee.new()
		@hostelfee.year=Date.today.year
		@hostelfee.status=true
      	redirect_to student_hostelfee_index_path(current_user.id)
	else
		flash[:PaymentNotice]='Payment Failed'
		redirect_to new_student_hostelfee_path(current_user.id)
	end

	end

	private

    def GenerateToken
    	cardnumber="card[number]"
    	@SecretKey="sk_test_51IKcX5JvMhB28Qnk9fMHc1ws88pz34plPnwmGccDPSu9hvo7BHzCeTPaPDUdBWWQY9nwdSJiIh42JzeZLGcnkyeH00RLKjqlup";
		@result = HTTParty.post('https://api.stripe.com/v1/tokens', 
    :body => { 'card[number]' => '4242424242424242', 
               'card[exp_month]' => '11', 
               'card[exp_year]' => '2023', 
               'card[cvc]' => '123'
             },
    :headers => { 
    			  'Content-Type' => 'application/x-www-form-urlencoded',
    			  'Authorization' => 'Bearer '+@SecretKey } )
		@token_id=JSON.parse(@result.to_json)['id'];
			 
		pay(@token_id)
    
	end

	def pay token_id
		puts '-----------------------------------------------'+token_id.to_s
		@result = HTTParty.post('https://api.stripe.com/v1/charges', 
    :body => { 'amount' => '176500', 
               'currency' => 'inr', 
               'description' => 'Payment From HDMS (Rails Project-Hostel Fees)', 
               'receipt_email' => 'rgp7714@gmail.com',
               'source' => token_id
             },
    :headers => { 
    			  'Content-Type' => 'application/x-www-form-urlencoded',
    			  'Authorization' => 'Bearer '+@SecretKey } )
			 
		puts @result
		
	end
end
