class QuizzesController < ApplicationController
  # GET /quizzes
  def index
    @quizzes = Quiz.all
    render json: @quizzes, include: :questions
  end
  # POST /quizzes
  def create
    quiz = Quiz.generate_random_quiz(quiz_params[:title], quiz_params[:num_questions].to_i)
    render json: quiz, include: :questions, status: :created
  rescue ActiveRecord::RecordInvalid => e
    render json: { error: e.message }, status: :unprocessable_entity
  end

  # POST /quizzes/:id/submit
  def submit
    quiz = Quiz.find(params[:id])
    score = 0
    params[:answers].each do |question_id, answer|
      question = quiz.questions.find(question_id)
      score += 1 if question.correct?(answer)
    end
    render json: { score: score, total: quiz.questions.count }
  rescue ActiveRecord::RecordNotFound => e
    render json: { error: e.message }, status: :not_found
  end

  private

  def quiz_params
    params.require(:quiz).permit(:title, :num_questions)
  end
end
