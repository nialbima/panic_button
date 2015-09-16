json.array!(@topics) do |topic|
  json.extract! topic, :id, :name, :docs_url, :description
  json.url topic_url(topic, format: :json)
end
