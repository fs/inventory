require 'ostruct'

class UserUnitsController < ApplicationController
  before_filter :load_user

  # GET /users/1/units
  def index
    @on_depot_units = Unit.on_depot.includes(:user, :room)
    @user_units, @search = search(@user.units.includes(:user, :room))

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  # POST /users/1/units
  def create
    @unit = Unit.find(params[:unit][:id])

    respond_to do |format|
      if @unit.assign_to_user!(@user)
        format.html { redirect_to(user_units_path(@user), :notice => 'Unit was successfully assigned.') }
      else
        format.html { render :action => "new" }
      end
    end
  end

  # DELETE /users/1/units/1
  def destroy
    @unit = Unit.find(params[:id])
    @unit.place_on_depot!

    respond_to do |format|
      format.html { redirect_to(user_units_path(@user), :notice => 'Unit placed on depot.') }
    end
  end

  private

  def load_user
    @user ||= User.includes(:units).find(params[:user_id])
  end
end
