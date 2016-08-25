json.extract! product, :id, :name, :description, :code, :created_at, :updated_at
json.url product_url(product, format: :json)