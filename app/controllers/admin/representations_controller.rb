class Admin::RepresentationsController < ApplicationController
  before_action :ensure_admin_user, except: :destroy

  def create
    user = User.find(params[:user_id])

    session[:delegated_user_id] = user.id
    session[:delegated_user_expires_at] = 3.hours.from_now.to_i

    redirect_to :root
  end

  def destroy
    session.delete(:delegated_user_id)
    session.delete(:delegated_user_expires_at)

    redirect_to :root
  end
end
