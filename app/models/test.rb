class Test < ActiveRecord::Base
	has_many :questions
  has_many :user_results
  accepts_nested_attributes_for :questions

  def questions_for_form
    collection = questions.where(test_id: id)
    collection.any? ? collection : 3.times { questions.build }
  end
end
