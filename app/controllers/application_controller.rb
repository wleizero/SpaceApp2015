class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  after_filter :flash_to_headers


  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper

  helper_method :resource, :resource_name, :devise_mapping


  rescue_from CanCan::AccessDenied do |exception|
    redirect_to new_user_session_path, :alert => exception.message
  end

  before_filter do
    resource = controller_name.singularize.to_sym
    method = "#{resource}_params"
    params[resource] &&= send(method) if respond_to?(method, true)
  end

  def after_sign_in_path_for(resource_or_scope)
    case resource_or_scope
    when :user, User
      store_location = session[:return_to]
      clear_stored_location
      (store_location.nil?) ? "/" : store_location.to_s
    else
      super
    end
  end


  def flash_to_headers
    return unless request.xhr?
    response.headers['X-Message'] = flash[:error]  unless flash[:error].blank?

    flash.discard  # don't want the flash to appear when you reload page
  end


  def resource_name
    :user
  end

  def resource
    @resource ||= User.new(display_name: Bazaar.super_object)
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end


  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :display_name
  end
end
