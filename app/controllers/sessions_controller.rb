# coding: utf-8
class SessionsController < ApplicationController
  before_filter :require_login, only: :destroy

  def new
    @user = User.new
  end

  def create
    if @user = login(params[:login], params[:password])
      redirect_back_or_to root_url, notice: "Welcome #{@user.login}."
    else
      flash.now[:alert] = 'Username or password differently.'
      render action: 'new'
    end                                                                                     end

  def destroy
    logout
    redirect_to root_url, notice: 'Logged out.'
  end
end
