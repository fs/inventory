class UnitsController < ApplicationController
  # GET /units
  def index
    @units, @search = search(Unit.not_on_depot.includes(:user, :room))

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  # GET /units/on_depot
  def on_depot
    @units, @search = search(Unit.on_depot.includes(:user, :room))

    respond_to do |format|
      format.html
    end
  end

  # GET /units/new
  def new
    @unit = Unit.new(:room_id => params[:room_id].to_i, :on_depot => params[:on_depot])

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # GET /units/1/edit
  def edit
    @unit = Unit.find(params[:id])
  end

  # POST /units
  def create
    @unit = Unit.new(params[:unit])

    respond_to do |format|
      if @unit.save
        format.html { redirect_to(units_url, :notice => 'Unit was successfully created.') }
      else
        format.html { render :action => "new" }
      end
    end
  end

  # PUT /units/1
  def update
    @unit = Unit.find(params[:id])

    respond_to do |format|
      if @unit.update_attributes(params[:unit])
        format.html { redirect_to(units_url, :notice => 'Unit was successfully updated.') }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  # DELETE /units/1
  def destroy
    @unit = Unit.find(params[:id])
    @unit.destroy

    respond_to do |format|
      format.html { redirect_to(units_url) }
    end
  end
end
