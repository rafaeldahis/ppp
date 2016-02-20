json.array!(@entries) do |entry|
  json.extract! entry, :id, :task, :status
  json.url entry_url(entry, format: :json)
end
