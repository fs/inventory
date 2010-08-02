require 'ostruct'

class UsersController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource

  # GET /users
  def index
    @users, @search = search(User.scoped)

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  # DELETE /users/1
  def destroy
#    @user = User.find(params[:id])

    if @user.deletable?
      @user.destroy
    else
      flash[:error] = "You can't delete user full of units"
    end

    respond_to do |format|
      format.html { redirect_to(users_url) }
    end
  end
end
