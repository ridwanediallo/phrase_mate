class Phrase < ApplicationRecord
  # Validations
  validates :text, presence: true, uniqueness: true
  validates :meaning, presence: true
  validates :difficulty_level, inclusion: { in: %w[Beginner Intermediate Advanced] }

  # Associations
  has_many :phrase_tags, dependent: :destroy
  has_many :tags, through: :phrase_tags

  # Search by keyword in text or meaning
  scope :search, ->(keyword) { where("text ILIKE ? OR meaning ILIKE ?", "%#{keyword}%", "%#{keyword}%") }

  # Search by text, category, difficulty level, and tags
  def self.search(params)
    phrases = Phrase.all
    phrases = phrases.where("text ILIKE ?", "%#{params[:text]}%") if params[:text].present?
    phrases = phrases.where(category: params[:category]) if params[:category].present?
    phrases = phrases.where(difficulty_level: params[:difficulty_level]) if params[:difficulty_level].present?
    phrases = phrases.where("tags @> ARRAY[?]::varchar[]", params[:tags].split(",")) if params[:tags].present?
    phrases
  end
end
