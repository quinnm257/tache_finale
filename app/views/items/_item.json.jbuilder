json.extract! item, :id, :instrument_id, :serial_number, :description, :condition, :production_year, :price, :created_at, :updated_at
json.url item_url(item, format: :json)
