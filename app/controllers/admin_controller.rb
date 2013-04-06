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
    
    # words = Word.find(:all)
    words = Word.find(:all, :order => "id")
    
    #REF=> http://stackoverflow.com/questions/7923674/active-record-get-the-second-third-item-in-a-database-without-id ## "answered Oct 27 '11 at 23:42"
    texts = Text.limit(3)
    
    @message = ""

    if texts != nil
      
      text = texts[texts.length - 1]

      @message += "Target text id=" + text.id.to_s + "\n"
      
    else
      
      @message = "texts.length => 0"
      
      return
      
    end
    # text = texts[2]
    # texts = Text.limit(2)
    # text = texts[1]
    
    
    logout("=============================================")
    logout("text.id=" + text.id.to_s)
    
    # @message = "text.id=" + text.id.to_s
    
    if words != nil
      
      logout("words.length=" + words.length.to_s)
      
      @message += "[" + __FILE__ + " " + Time.now.to_s + "/" + __LINE__.to_s + "]" + "\n"\
                + "words.length=" + words.length.to_s + "\n"
      
      # for i in (1..words.length)
      for i in (0..words.length - 1)
        
        word = words[i]
        
        if word != nil
          
          logout(word.w1 + "\n")
          
          res = isIn?(text, word.w1, @message)
          
          if res == true
            
            res2 = text.words << word
            
            logout(
                "New word entered:"\
                + word.w1\
                + "(id=" + word.id.to_s + ")"\
                + "/text id=" + text.id.to_s\
                + "res2=" + res2.to_s\
                + "/" + res2.class.to_s)
            
            @message +=
                "[" + __FILE__ + " " + Time.now.to_s + "]" + "/" + __LINE__.to_s + "]"\
                + "\n"\
                + "** "\
                + "New word entered:"\
                + word.w1\
                + "(id=" + word.id.to_s + ")"\
                + "/text id=" + text.id.to_s\
                + " ***"
                # + "res2=" + res2.to_s\
                # + "/" + res2.class.to_s\
            
          end#if res == true
          
        else#if word != nil
          
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
