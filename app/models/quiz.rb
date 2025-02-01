class Quiz < ApplicationRecord
  has_many :questions, dependent: :destroy

  validates :title, presence: true

  # Method to generate a quiz with random questions
  def self.generate_random_quiz(title, num_questions)
    quiz = Quiz.create!(title: title)
    phrases = Phrase.order("RANDOM()").limit(num_questions)
    phrases.each do |phrase|
      quiz.questions.create!(
        phrase: phrase,
        question_text: "What is the meaning of '#{phrase.text}'?",
        correct_answer: phrase.meaning,
        wrong_answers: Phrase.where.not(id: phrase.id).order("RANDOM()").limit(3).pluck(:meaning)
      )
    end
    quiz
  end
end
