class Question < ActiveRecord::Base
	has_many :answers
  has_many :user_results

  belongs_to :test
  accepts_nested_attributes_for :answers

  def answers_for_form
    collection = answers.where(question_id: id)
    collection.any? ? collection : 4.times { answers.build }
  end
end
