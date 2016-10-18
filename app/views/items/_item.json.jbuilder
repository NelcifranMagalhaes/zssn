json.extract! item, :id, :name, :points, :quant, :inventory_id, :created_at, :updated_at
json.url item_url(item, format: :json)