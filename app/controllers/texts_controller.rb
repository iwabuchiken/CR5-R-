class TextsController < ApplicationController
  # GET /texts
  # GET /texts.json
  def index
    @texts = Text.all

    since = params[:since]
    
    # debug
    index_debug(since)
    

    #debug
    # index_debug()
    

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @texts }
    end
  end#def index

  def index_debug(content)
    # target = "target.txt"
    # target = "doc/target.txt"
    # newDir = "doc/abc"
    # newDir = "doc/abcdef"
    
    # if not FileTest::directory?()
    # if not File.exists?(newDir)
      # Dir::mkdir(newDir)
    # end
    
    target = "doc/abc/target.txt"
    # content = "abcdefg"
    # File.open(target, "w+") do |f|
    File.open(target, "a") do |f|
      f.write(content)
      f.write("\n")
    end
    
  end#def index_debug()

  # def index_debug()
    # # target = "target.txt"
    # # target = "doc/target.txt"
    # # newDir = "doc/abc"
    # newDir = "doc/abcdef"
#     
    # # if not FileTest::directory?()
    # if not File.exists?(newDir)
      # Dir::mkdir(newDir)
    # end
#     
    # target = "doc/abc/target.txt"
    # content = "abcdefg"
    # File.open(target, "w+") do |f|
      # f.write(content)
    # end
#     
  # end#def index_debug()

  # GET /texts/1
  # GET /texts/1.json
  def show
    @text = Text.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @text }
      # format.json { render :json => @text.to_json()}
    end
  end

  # GET /texts/new
  # GET /texts/new.json
  def new
    @text = Text.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @text }
    end
  end

  # GET /texts/1/edit
  def edit
    @text = Text.find(params[:id])
  end

  # POST /texts
  # POST /texts.json
  def create
    @text = Text.new(params[:text])

    respond_to do |format|
      if @text.save
        format.html { redirect_to @text, notice: 'Text was successfully created.' }
        format.json { render json: @text, status: :created, location: @text }
      else
        format.html { render action: "new" }
        format.json { render json: @text.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /texts/1
  # PUT /texts/1.json
  def update
    @text = Text.find(params[:id])

    respond_to do |format|
      if @text.update_attributes(params[:text])
        format.html { redirect_to @text, notice: 'Text was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @text.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /texts/1
  # DELETE /texts/1.json
  def destroy
    @text = Text.find(params[:id])
    @text.destroy

    respond_to do |format|
      format.html { redirect_to texts_url }
      format.json { head :no_content }
    end
  end
end
