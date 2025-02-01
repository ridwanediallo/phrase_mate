class Question < ApplicationRecord
  belongs_to :quiz
  belongs_to :phrase

  validates :question_text, :correct_answer, presence: true

  # Method to check if a given answer is correct
  def correct?(answer)
    answer == correct_answer
  end
end
