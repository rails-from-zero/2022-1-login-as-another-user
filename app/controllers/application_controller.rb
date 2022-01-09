class ApplicationController < ActionController::Base
  def ensure_admin_user
    unless current_user&.admin?
      head :forbidden
    end
  end

  def ensure_not_delegated
    if delegated_user?
      redirect_to :root, alert: "Sorry you're not allowed to do that!"
    end
  end

  alias_method :original_current_user, :current_user
  helper_method :original_current_user

  def current_user
    if delegated_user?
      User.find(session[:delegated_user_id])
    else
      original_current_user
    end
  end

  def delegated_user?
    session[:delegated_user_id] &&
      original_current_user&.admin? &&
      Time.at(session[:delegated_user_expires_at]) > Time.now
  end
  helper_method :delegated_user?
end
