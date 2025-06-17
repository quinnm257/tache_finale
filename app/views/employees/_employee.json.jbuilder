json.extract! employee, :id, :employee_name, :store_id, :position, :hire_date, :birth_date, :phone, :email, :created_at, :updated_at
json.url employee_url(employee, format: :json)
