class ApplicationController < ActionController::Base
  def ensure_admin_user
    unless current_user&.admin?
      head :forbidden
    end
  end
end
