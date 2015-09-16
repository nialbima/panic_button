json.array!(@resources) do |resource|
  json.extract! resource, :id, :name, :description, :link, :img_url, :week, :user_id
  json.url resource_url(resource, format: :json)
end
