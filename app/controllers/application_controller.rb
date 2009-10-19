# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

require 'gettext_rails'

class ApplicationController < ActionController::Base

  init_gettext('software')

  def rescue_action_in_public(exception)
    @message = exception.message
    if request.xhr?
      render :template => "error", :layout => false, :status => 404
    else
      render :template => 'error', :layout => "application", :status => 404
    end
  end
  
end
