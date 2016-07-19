class DashboardController < ApplicationController
  def index
  	@loan = Loan.new
  	@books_on_loan = Book.on_loan
  end
	
	def submit_checkout
		default_price = Setting.find_by_name("default_loan_price").value
		set_params = loan_params.merge({price: default_price, start_point: Date.today})
		@loan = Loan.new(set_params)

    if @loan.save
			redirect_to dashboard_path, notice: 'Loan was successfully created.'
    else
      render :new
    end
	end 

  def submit_return
		@loan = Book.find(loan_params[:book_id]).active_loan
    if @loan.update(end_point: Date.today)
			redirect_to dashboard_path, notice: 'Book was successfully returned.'
    else
      render :new
    end
	end

	def loan_params
		params.require(:loan).permit(:book_id, :user_id, :start_point, :end_point, :price)
	end


end
