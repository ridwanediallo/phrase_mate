class Tag < ApplicationRecord
  has_many :phrase_tags, dependent: :destroy
  has_many :phrases, through: :phrase_tags

  validates :name, presence: true, uniqueness: true
end
