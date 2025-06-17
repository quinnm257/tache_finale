json.extract! instrument, :id, :instrument_name, :manufacturer_id, :category_id, :created_at, :updated_at
json.url instrument_url(instrument, format: :json)
