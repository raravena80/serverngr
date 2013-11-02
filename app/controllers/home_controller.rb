class HomeController < ApplicationController
  #skip_authorization_check
  authorize_resource :class => false

  def about
  end

  def contact
  end

end
