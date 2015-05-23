json.array!(@proposals) do |proposal|
  json.extract! proposal, :id, :description, :owner_id, :buyer_id, :item_id
  json.url proposal_url(proposal, format: :json)
end
