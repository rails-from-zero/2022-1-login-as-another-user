class Admin::UsersController < ApplicationController
  before_action :ensure_admin_user

  def index
    @users = User.all
  end
end
