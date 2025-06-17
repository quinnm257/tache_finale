json.extract! repair, :id, :item_id, :customer_id, :repair_date, :description, :price, :payment_status, :created_at, :updated_at
json.url repair_url(repair, format: :json)
