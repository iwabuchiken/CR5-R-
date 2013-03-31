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
end
