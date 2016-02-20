json.array!(@trackers) do |tracker|
  json.extract! tracker, :id, :period
  json.url tracker_url(tracker, format: :json)
end
