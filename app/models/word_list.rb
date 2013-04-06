class WordList < ActiveRecord::Base
  
  # validates_uniqueness_of :text_id, :scope => :word_id
  # validate :check
  
  belongs_to :text
  belongs_to :word
  
  private
  def check
    
    
    # logout("wordlist id=" + self.id.to_s + "\n")
    # logout("wordlist text_id=" + self.text_id.to_s + "\n")
    
  end#def check
  
end#class WordList < ActiveRecord::Base
