class PhrasesController < ApplicationController
  before_action :set_phrase, only: %i[show update destroy]
  before_action :authorize_request

  # GET /phrases
  def index
    @phrases = Phrase.all
    render json: @phrases
  end

  # GET /phrases/:id
  def show
    render json: @phrase
  end

  # POST /phrases
  def create
    @phrase = Phrase.new(phrase_params)
    if @phrase.save
      render json: @phrase, status: :created
    else
      render json: @phrase.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /phrases/:id
  def update
    if @phrase.update(phrase_params)
      render json: @phrase
    else
      render json: @phrase.errors, status: :unprocessable_entity
    end
  end

  # DELETE /phrases/:id
  def destroy
    @phrase.destroy
  end

  private

  def set_phrase
    @phrase = Phrase.find(params[:id])
  end

  def phrase_params
    params.require(:phrase).permit(:text, :meaning, :examples)
  end
end
