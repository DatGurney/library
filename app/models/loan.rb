class Loan < ActiveRecord::Base

  belongs_to :book
  belongs_to :user

  validates :book, presence: true
	validates :user, presence: true
	validates :start_point, presence: true, inclusion: { in: 130.days.ago.to_date..Date.today}
	validates :end_point, inclusion: { in: 130.days.ago.to_date..Date.today}, allow_blank: true

	validate :no_active_fines, on: :create
	validate :one_loan_per_book, on: :create

 	scope :active, -> { where(end_point: nil) }
 	scope :past, -> { where.not(end_point: nil) }
 	scope :fines, -> { where.not(fine_amount: nil)}
 	scope :overdue, -> { 
 		where("(end_point IS NOT NULL AND (end_point - start_point) > ?) OR (end_point IS NULL AND start_point < ?)", 
 			(Setting.find_by_name("max_loan_time").value.to_f),
 			(Date.today.days_ago Setting.find_by_name("max_loan_time").value.to_f)
 		)
 	}

 	after_validation :set_fine

	def one_loan_per_book
		if book.loans.active.count > 0
			errors.add :book, "Cannot checkout a book already on loan"
		end
	end 

	def set_fine
		if self.end_point.present? && overdue?
			self.fine_amount = Setting.find_by_name("fine_amount").value.to_f * overdue_by.to_f
		end
	end

	def overdue_by
		if end_point.present?
			(end_point - start_point).to_i.to_f - Setting.find_by_name("max_loan_time").value.to_f
		else
			(Date.today - start_point).to_i.to_f - Setting.find_by_name("max_loan_time").value.to_f
		end
	end

	def no_active_fines
		if user.present? && user.loans.overdue.active.count > 0
			errors.add :user, 'User has active fines'
		end
	end

	def overdue?
		overdue_by > 0
	end

	def active?
		end_point.blank?
	end

	def past?
		!active?
	end

	def css_state
		if overdue? && active?
			"danger"
		elsif overdue? && past?
			"warning"
		elsif !overdue? && active?
			"success"
		else
			"info"
		end
	end
end
