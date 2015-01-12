json.array!(@markers) do |marker|
  json.extract! marker, :id, :lat, :lon, :description, :rou_id, :stop_no
  json.url marker_url(marker, format: :json)
end
