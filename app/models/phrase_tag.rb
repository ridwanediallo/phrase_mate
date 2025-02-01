class PhraseTag < ApplicationRecord
  belongs_to :phrase
  belongs_to :tag
end
