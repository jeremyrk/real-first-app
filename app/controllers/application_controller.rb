class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  

   protect_from_forgery

    rescue_from CanCan::AccessDenied do |exception|
      redirect_to root_url, :alert => exception.message
    end

    def after_sign_in_path_for(resource)
      topics_path
    end  


  ######### OLD #########
  
  # protect_from_forgery with: :exception
  # before_filter :configure_permitted_parameters, if: :devise_controller?   # need this line for Rails 4.0.0

  # rescue_from CanCan::AccessDenied do |exception|
  #   redirect_to root_url, :alert => exception.message
  # end

  #params #{ :user => { :password => '...', :name => '...' }}
  
  ######### OLD (end) #########

protected                                                           # need this line for Rails 4.0.0
  def configure_permitted_parameters                                # need this line for Rails 4.0.0
    devise_parameter_sanitizer.for(:account_update) << :name        # need this line for Rails 4.0.0
    devise_parameter_sanitizer.for(:account_update) << :avatar      # need this line for Rails 4.0.0 
  end 
end                                                              # need this line for Rails 4.0.0
