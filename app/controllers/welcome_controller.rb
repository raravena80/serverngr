class WelcomeController < ApplicationController
  # Allow logged out users to view this
  skip_authorization_check

  def index
    if current_user
      Rails.logger.info '*** Redirecting to home since logged in'
      redirect_to home_path
    end
  end
end
