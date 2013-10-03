json.array!(@solutions) do |solution|
  json.extract! solution, :text, :estimate, :currency, :email, :telephone, :company, :company_telephone, :problem_id, :user_id
  json.url solution_url(solution, format: :json)
end
