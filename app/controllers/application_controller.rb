class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  helper_method :current_user_can_edit?
  helper_method :current_user_can_subscribe?
  helper_method :check_event_subscribe?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:password, :password_confirmation, :current_password])
  end

  def current_user_can_edit?(model)
    user_signed_in? &&
      model.user == current_user || (model.try(:event).present? && model.event.user == current_user)
  end

  def current_user_can_subscribe?(event)
    @event.user != current_user
  end

  def check_event_subscribe?(event)
    @event.subscriptions.count > 0 || @event.subscribers.count > 0
  end

  def user_can_add_photo?
    current_user.present?
  end
end
