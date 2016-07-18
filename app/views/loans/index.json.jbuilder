json.array!(@loans) do |loan|
  json.extract! loan, :id, :book_id, :user_id, :start_point, :end_point, :price
  json.url loan_url(loan, format: :json)
end
