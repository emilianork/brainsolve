json.array!(@problems) do |problem|
  json.extract! problem, :title, :contact, :description, :telephone, :areas_of_knowledge, :user_id
  json.url problem_url(problem, format: :json)
end
