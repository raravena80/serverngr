class SessionsController < ApplicationController
  def new
    redirect_to '/auth/google_oauth2'
  end

  def create
    auth = request.env['omniauth.auth']
    email = auth["info"]["email"]
    # render :text => auth.inspect

    # Only allow our email addresses for security
    if email.end_with?(ENV['COMPANY_DOMAIN'])
      user = User.find_by_provider_and_uid(auth["provider"], auth["uid"].to_s) || User.create_from_omniauth(auth)

      # Make the first user an admin
      if User.count == 1
        user.add_role :admin
      else
        user.add_role :user
      end

      session[:user_id] = user.id
      redirect_to root_url, :notice => 'Logged in' + user.id.to_s
    else
      Rails.logger.warn 'Invalid email used: ' + email
      redirect_to bad_path, :notice => 'Invalid login'
    end
  end

  # Destroy a session, which logs a user out
  def destroy
    session[:user_id] = nil
    reset_session
    redirect_to root_url, :notice => 'Logged out'
  end

  # Action when a bad email address was used
  def bad
    session[:user_id] = nil
    reset_session
    render :text => '<pre>Invalid Login</pre>'
  end

  def failure
    redirect_to root_url, :alert => "Authentication error: #{params[:message].humanize}"
  end
end
