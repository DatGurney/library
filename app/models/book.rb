class Book < ActiveRecord::Base
	has_many :loans

	validates :author, presence: true
	validates :name, presence: true
	validates :publisher, presence: true
	validates :isbn, format: {with: /\d{10}/}


	before_validation :clean_isbn

	scope :on_loan, -> (){ joins(:loans).where(loans: {end_point: nil}) }

	def clean_isbn
		isbn.gsub!("-", "")
	end

	def on_loan?
		loans.active.count > 0
	end

	def active_loan
		loans.active.first
	end

end
