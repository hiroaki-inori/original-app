class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :configure_account_update_parameters, if: :devise_controller?
  before_action :basic_auth

  protected

  def configure_account_update_parameters
    devise_parameter_sanitizer.permit(:account_update, keys: [:nickname, :age_id, :gender_id, :occupation_id, :prof_image, :pr])
  end

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :age_id, :gender_id, :occupation_id, :prof_image, :pr])
  end

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
    end
  end
end
