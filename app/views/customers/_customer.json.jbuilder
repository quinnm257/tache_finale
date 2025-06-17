json.extract! customer, :id, :customer_name, :email, :phone, :delivery_adress, :created_at, :updated_at
json.url customer_url(customer, format: :json)
