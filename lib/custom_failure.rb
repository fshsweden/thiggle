class CustomFailure < Devise::FailureApp
  def redirect_url
    if user_logged_in?
      account_dashboard_index_path
    end
  end

  def respond
    if http_auth?
      http_auth
    else
      redirect
    end
  end
end