Setting.first_or_create!({
	name: 'default_loan_price'
}).update(value: 2.95)

unless Setting.find_by_name("max_loan_time").present?
	Setting.create!({
		name: 'max_loan_time',
		value: '30'
	})
end
unless Setting.find_by_name("fine_amount").present?
	Setting.create!({
		name: 'fine_amount',
		value: '5'
	})
end