json.array!(@answers) do |answer|
  json.extract! answer, :id, :name, :question_id, :is_right
  json.url answer_url(answer, format: :json)
end
