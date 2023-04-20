json.extract! visit, :id, :url_id, :geolocation, :created_at, :updated_at
json.url visit_url(visit, format: :json)
