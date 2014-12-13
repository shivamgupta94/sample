json.array!(@rous) do |rou|
  json.extract! rou, :id, :IMEI_no, :Mobile_no
  json.url rou_url(rou, format: :json)
end
