class AdminController < ApplicationController
  def main

    # @content = nil
    # target = "doc/abc/target.txt"
    target = "doc/abc/log.txt"
    
    # @content = "111111111"
    @content = ""
    
    if File.exists?(target)
      
      File.open(target, "r") do |f|
        
        @content = f.read()
        # f.write(content)
        # f.write("\n")
      end

    else
      
      @content = "abcdefg"
      
    end
    
    # File.open(target, "r") do |f|
#       
      # @content = f.read()
      # # f.write(content)
      # # f.write("\n")
    # end
    
  end

  def sub1
  end

  def sub2
  end
  
  def word_list
    
    words = Word.find(:all)
    texts = Text.limit(3)
    text = texts[2]
    # texts = Text.limit(2)
    # text = texts[1]
    
    @message = ""
    
    logout("=============================================")
    logout("text.id=" + text.id.to_s)
    
    @message = "text.id=" + text.id.to_s
    
    if words != nil
      
      logout("words.length=" + words.length.to_s)
      
      @message = "words.length=" + words.length.to_s
      
      # for i in (1..words.length)
      for i in (0..words.length - 1)
        
        word = words[i]
        
        if word != nil
          
          logout(word.w1 + "\n")
          
          res = isIn?(text, word.w1, @message)
          
          
          
        else
          
          logout("nil" + "\n")
          
          @message += "nil" + "\n"
          
        end
        logout(word.w1 + "\n")
        
      end#for words.length
      
      # @message = "Done"
      
    else
      
      @message = "words != nil"
      
    end#if words != nil
    
  end#def word_list
  
  def isIn?(text, target_word, message)
    
    logout("target_word=" + target_word)
    
    # regex = Regexp.new("^this is regexp")
    regex = Regexp.new(target_word)
    
    if text.text =~ regex
      
      logout("Match: " + target_word)
      
      message += "Match: " + target_word
      
      return true
      
    else

      logout("Doesn't match: " + target_word)
      message += "Doesn't match: " + target_word
      
      return false
      
    end#if text.text =~ regex
    
  end#def isIn?(text, target_word)
  
end#class AdminController < ApplicationController
