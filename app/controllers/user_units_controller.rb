class UserUnitsController < ApplicationController
  # GET /users/1/units
  def index
    @user = user
    @on_depot_units = Unit.on_depot

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  # POST /users/1/units
  def create
    @user = user
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
      format.html { redirect_to(user_units_path(user), :notice => 'Unit placed on depot.') }
    end
  end

  private

  def user
    @user ||= User.find(params[:user_id])
  end
end
