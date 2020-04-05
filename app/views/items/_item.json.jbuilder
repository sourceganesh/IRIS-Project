json.extract! item, :id, :title, :description, :bid, :deadline, :contact, :created_at, :updated_at
json.url item_url(item, format: :json)
