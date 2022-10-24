# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Pundit::Authorization

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  before_action :configure_permitted_parameters, if: :devise_controller?
  helper_method :current_user_can_edit?
  helper_method :current_user_can_subscribe?
  helper_method :check_event_subscribe?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[password password_confirmation current_password])
  end

  def current_user_can_edit?(model)
    user_signed_in? &&
      model.user == current_user || (model.try(:event).present? && model.event.user == current_user)
  end

  def current_user_can_subscribe?(_event)
    @event.user != current_user
  end

  def check_event_subscribe?(_event)
    @event.subscriptions.count.positive? || @event.subscribers.count.positive?
  end

  def user_can_add_photo?
    current_user.present?
  end

  def pundit_user
    UserContext.new(current_user, cookies, params[:pincode])
  end

  private

  def user_not_authorized
    flash[:alert] = t('pundit.not_authorized')
    redirect_to(request.referrer || root_path)
  end
end
