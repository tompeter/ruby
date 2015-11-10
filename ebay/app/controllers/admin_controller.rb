class AdminController < ApplicationController  
  before_action :authenticate_user!
  before_action :authenticate_admin_user!

  private

  def authenticate_admin_user!
    return if current_user.super_admin?
    redirect_to root_url, notice: 'Unauthorized. Access denied.'
  end
end
