class PhrasesController < ApplicationController
  before_action :set_phrase, only: %i[show update destroy]
  before_action :authorize_request

  # GET /phrases
  def index
    @phrases = Phrase.page(params[:page]).per(params[:per_page] || 10)
    render json: @phrases.as_json(only: [ :id, :text, :meaning, :examples, :category, :difficulty_level, :tags, :related_phrases, :audio_url ])
  end

  # GET /phrases/:id
  def show
    render json: @phrase.as_json(only: [ :id, :text, :meaning, :examples, :category, :difficulty_level, :tags, :related_phrases, :audio_url ])
  end

  # POST /phrases
  def create
    phrase = Phrase.new(phrase_params)
    if phrase.save
      phrase.tags << Tag.where(id: params[:tag_ids]) if params[:tag_ids].present?
      render json: phrase, status: :created
    else
      render json: { errors: phrase.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /phrases/:id
  def update
    if @phrase.update(phrase_params)
      @phrase.tags = Tag.where(id: params[:tag_ids]) if params[:tag_ids].present?
      render json: @phrase, status: :ok
    else
      render json: { errors: @phrase.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # DELETE /phrases/:id
  def destroy
    @phrase.destroy
  end

  # GET /phrases/search
  def search
    @phrases = Phrase.search(params).page(params[:page]).per(params[:per_page] || 10)
    render json: @phrases.as_json(only: [ :id, :text, :meaning, :examples, :category, :difficulty_level, :tags, :related_phrases, :audio_url ])
  end

  private

  def set_phrase
    @phrase = Phrase.find(params[:id])
  end

  def phrase_params
    params.require(:phrase).permit(:text, :meaning, :difficulty_level)
  end
end
