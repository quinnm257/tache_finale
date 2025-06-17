json.extract! order, :id, :customer_id, :employee_id, :order_date, :delivery_date, :payment_status, :delivery_status, :total_price, :created_at, :updated_at
json.url order_url(order, format: :json)
