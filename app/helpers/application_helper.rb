module ApplicationHelper

  def test_mode?
    true
    #false
  end

  def authorize_admin
    store_location

    unless current_user.admin?
      flash[:error] = "<h4 class='alert-heading'>Unauthorized Access!</h4>Sorry, You don't have permission to access <b>#{session[:requested_page]}</b>".html_safe
      redirect_back_or index_path
      false
    end
  end

  def redirect_back_or(default)
    redirect_to(session[:return_to] || default)
    clear_request_paths
  end

  private
  def store_location
    session[:return_to] ||= request.referer
    session[:requested_page] ||= request.fullpath
  end

  def clear_request_paths
    session[:return_to] = nil
    session[:requested_page] = nil
  end

end
