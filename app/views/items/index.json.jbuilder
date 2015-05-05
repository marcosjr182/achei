json.array!(@items) do |item|
  json.extract! item, :id, :name, :place, :category
  json.url item_url(item, format: :json)
end
