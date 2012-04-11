class LotsController < ApplicationController
  # GET /lots
  # GET /lots.json
  def index
    @lots = Lot.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @lots }
    end
  end

  # GET /lots/1
  # GET /lots/1.json
  def show
    @lot = Lot.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @lot }
    end
  end

  # GET /lots/new
  # GET /lots/new.json
  def new
    @lot = Lot.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @lot }
    end
  end

  # GET /lots/1/edit
  def edit
    @lot = Lot.find(params[:id])
  end

  # POST /lots
  # POST /lots.json
  def create
    @lot = Lot.new(params[:lot])

    respond_to do |format|
      if @lot.save
        format.html { redirect_to @lot, notice: 'Lot was successfully created.' }
        format.json { render json: @lot, status: :created, location: @lot }
      else
        format.html { render action: "new" }
        format.json { render json: @lot.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /lots/1
  # PUT /lots/1.json
  def update
    @lot = Lot.find(params[:id])

    respond_to do |format|
      if @lot.update_attributes(params[:lot])
        format.html { redirect_to @lot, notice: 'Lot was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @lot.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lots/1
  # DELETE /lots/1.json
  def destroy
    @lot = Lot.find(params[:id])
    @lot.destroy

    respond_to do |format|
      format.html { redirect_to lots_url }
      format.json { head :no_content }
    end
  end
end
