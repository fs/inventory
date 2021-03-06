require 'ostruct'

class UnitsController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource

  # GET /units
  def index
    @units, @search = search(Unit.not_on_depot.includes(:user, :room), 9)

    respond_to do |format|
      format.html # index.html.erb
      format.csv do
        render :text => Unit.report_table(:all,
          :only => [:unit_type, :inv_id, :name, :description, :on_depot],
          :include => {:user => {:only => [:full_name]}}
        ).as(:csv)
      end
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
    @unit = Unit.new(:room_id => params[:room_id].to_i,
      :on_depot => params[:on_depot],
      :user_id => (params[:user_id] || current_user.id).to_i)

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # GET /units/1/edit
  def edit
#    @unit = Unit.find(params[:id])
  end

  # POST /units
  def create
#    @unit = Unit.new(params[:unit])

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
#    @unit = Unit.find(params[:id])

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
#    @unit = Unit.find(params[:id])
    @unit.destroy

    respond_to do |format|
      format.html { redirect_to(units_url) }
    end
  end
end
