class WinsController < ApplicationController
  # GET /wins
  # GET /wins.json
  def index
    @wins = Win.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @wins }
    end
  end

  # GET /wins/1
  # GET /wins/1.json
  def show
    @win = Win.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @win }
    end
  end

  # GET /wins/new
  # GET /wins/new.json
  def new
    @win = Win.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @win }
    end
  end

  # GET /wins/1/edit
  def edit
    @win = Win.find(params[:id])
  end

  # POST /wins
  # POST /wins.json
  def create
    @win = Win.new(params[:win])

    respond_to do |format|
      if @win.save
        format.html { redirect_to @win, :notice => 'Win was successfully created.' }
        format.json { render :json => @win, :status => :created, :location => @win }
      else
        format.html { render :action => "new" }
        format.json { render :json => @win.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /wins/1
  # PUT /wins/1.json
  def update
    @win = Win.find(params[:id])

    respond_to do |format|
      if @win.update_attributes(params[:win])
        format.html { redirect_to @win, :notice => 'Win was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @win.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /wins/1
  # DELETE /wins/1.json
  def destroy
    @win = Win.find(params[:id])
    @win.destroy

    respond_to do |format|
      format.html { redirect_to wins_url }
      format.json { head :no_content }
    end
  end
end
