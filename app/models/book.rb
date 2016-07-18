class Book < ActiveRecord::Base
	validates :author, presence: true
	validates :name, presence: true
	validates :publisher, presence: true
	validates :isbn, format: {with: /\d{10}/}

	before_validation :clean_isbn

	def clean_isbn
		isbn.gsub!("-", "")
	end
	validates :first_name, presence: true
	validates :last_name, presence: true
	validates :email, format: {with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i}
	validates :address_line1, presence: true
	validates :address_line2, presence: true
	validates :address_city, presence: true
	validates :address_country, presence: true
	validates :address_postcode, format: {with: /([a-z]{1,2}[0-9]{1,2})([a-z]{1,2})?(\W)?([0-9]{1,2}[a-z]{2})?/}
end