class Word < ActiveRecord::Base
  has_many :word_lists
  has_many :texts, through: :word_lists
end
