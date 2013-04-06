class Word < ActiveRecord::Base
  # validates_uniqueness_of :w1
  validates :w1, uniqueness: true
  
  has_many :word_lists
  has_many :texts, through: :word_lists
end
