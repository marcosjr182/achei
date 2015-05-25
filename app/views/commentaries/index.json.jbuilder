json.array!(@commentaries) do |commentary|
  json.extract! commentary, :id, :item_id, :user_id, :message
  json.url commentary_url(commentary, format: :json)
end
