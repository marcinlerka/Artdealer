class ApplicationController < ActionController::Base
  protect_from_forgery

  #    ==   CanCan exceptions logging  ==  
      rescue_from CanCan::AccessDenied do |exception|
        Rails.logger.debug "Access denied on #{exception.action} #{exception.subject.inspect}"
      end

end
