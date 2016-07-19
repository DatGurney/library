class Loan < ActiveRecord::Base

  belongs_to :book
  belongs_to :user

  validates :book, presence: true
	validates :user, presence: true
	validates :start_point, presence: true, inclusion: { in: 130.days.ago.to_date..Date.today}
	validates :end_point, inclusion: { in: 130.days.ago.to_date..Date.today}, allow_blank: true
#	validate :one_loan_per_book

 	scope :active, -> { where(end_point: nil) }
 	scope :past, -> { where.not(end_point: nil) }

	#def one_loan_per_book
	#	if book.loans.where(end_point: nil).where.not(start_point: start_point..end_point).count > 0
	#		errors.add :book, "Cannot Overlap"
	#	end
	#end 

end
