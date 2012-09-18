class WinsController < ApplicationController

  require 'csv'

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
    redirect_to :action => :edit
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
        format.html { redirect_to root_path, :notice => 'Win was successfully created.' }
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
        format.html { redirect_to edit_win_path(@win), :notice => 'Win was successfully updated.' }
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

  def download
    report = StringIO.new

    CSV::Writer.generate(report, ',') do |title|
      title << ['Win Id','Entrant Id','Entrant Name','Ticket Number','Category Number','Category Name','Prize']
      
      Win.all.each do |win|
        title << [win.id, win.entrant.id, win.entrant.full_name, win.ticket_number, win.category.number, win.category.name, win.prize.name]
      end
    end

    report.rewind

    send_data(report.read,:type => 'text/csv;charset=iso-8859-1;', :filename => "wins-#{Date.today.to_s}.csv", :disposition => 'attachment', :encoding => 'utf8')
  end
end
