class WordsController < ApplicationController
  # GET /words
  # GET /words.json
  def index
    @words = Word.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @words }
    end
  end

  # GET /words/1
  # GET /words/1.json
  def show
    @word = Word.find(params[:id])

    #debug
    @texts = @word.texts
    ############################

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @word }
    end
  end

  # GET /words/new
  # GET /words/new.json
  def new
    @word = Word.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @word }
    end
  end

  # GET /words/1/edit
  def edit
    @word = Word.find(params[:id])
  end

  # POST /words
  # POST /words.json
  def create
    #debug
    logout("Creating a new Word instance...")
    
    @word = Word.new(params[:word])

    ################################################\
    text_id = @word.text_id
    
    # text = Text.find(:id => text_id.to_i)
    text = Text.find(text_id.to_i)
    
    if text != nil
      
      logout("text.id => " + text.id.to_s)
      
    else
      
      logout("text == nil")
      
    end
    # logout(text.)
    
    # text.words << @word
    # logout(text.words << @word)
    # res = text.words << @word
    
    # logout("res=" + res)
    # @word.texts << text     #=> "text.. << ..word" or "word.. << ..text"
                              #=> Both generate the same entry in the join table
                              #=> So, you only need to do either of the two.
    ################################################/

    logout("Saving a new Word instance...")

    respond_to do |format|
      if @word.save
        #debug
        text.words << @word
        
        format.html { redirect_to @word, notice: 'Word was successfully created.' }
        format.json { render json: @word, status: :created, location: @word }
      else
        format.html { render action: "new" }
        format.json { render json: @word.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /words/1
  # PUT /words/1.json
  def update
    @word = Word.find(params[:id])

    respond_to do |format|
      if @word.update_attributes(params[:word])
        format.html { redirect_to @word, notice: 'Word was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @word.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /words/1
  # DELETE /words/1.json
  def destroy
    @word = Word.find(params[:id])
    @word.destroy

    respond_to do |format|
      format.html { redirect_to words_url }
      format.json { head :no_content }
    end
  end
end#class WordsController

def logout(label)
  
    
    target = "doc/abc/log.txt"
    
    if not File.exists?(target)
      
      FileUtils.touch(target)
      
    end
    
    # content = "abcdefg"
    # File.open(target, "w+") do |f|
    File.open(target, "a") do |f|
      f.write("[" + __FILE__ + " " + Time.now.to_s + "/" + __LINE__.to_s + "]" + "\n")
      # f.write(content)
      f.write(label)
      f.write("\n")
    end

end
