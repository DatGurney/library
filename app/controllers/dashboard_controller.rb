class DashboardController < ApplicationController
  def index
  	index_info
  end
	
	def submit_checkout
		index_info
		default_price = Setting.find_by_name("default_loan_price").value
		set_params = loan_params.merge({price: default_price, start_point: Date.today})
		@checkout_loan = Loan.new(set_params)

    if @checkout_loan.save 
			redirect_to dashboard_path, notice: 'Loan was successfully created.'
    else
      render :index
    end
	end 

  def submit_return
  	index_info
		@return_loan = Book.find(loan_params[:book_id]).active_loan
    if @return_loan.update(end_point: Date.today)
			redirect_to dashboard_path, notice: 'Book was successfully returned.'
    else
      render :index
    end
	end

private

	def loan_params
		params.require(:loan).permit(:book_id, :book, :user_id, :user, :start_point, :end_point, :price)
	end

	def index_info
		@checkout_loan = Loan.new
  	@return_loan = Loan.new
  	@books_on_loan = Book.on_loan
	end


end
