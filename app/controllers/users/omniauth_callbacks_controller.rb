class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def github
    # You need to implement the method below in your model (e.g. app/models/user.rb)
    @user = User.find_for_github_oauth(request.env['omniauth.auth'])

    if @user.persisted?
      flash[:notice] = I18n.t 'devise.omniauth_callbacks.success', kind: 'Github'
      sign_in_and_redirect @user, event: :authentication
    else
      session['devise.google_data'] = request.env['omniauth.auth'].except('extra') # Removing extra as it can overflow some session stores
      redirect_to new_user_registration_url, alert: @user.errors.full_messages.join("\n")
    end
    # debugger
    # @user = User.find_for_github_oauth(request.env['omniauth.auth'])

    # if @user.persisted?
    #   flash[:notice] = I18n.t('devise.omniauth_callbacks.success', kind: 'Github')

    #   sign_in_and_redirect @user, event: :authentication
    # else
    #   flash[:error] = I18n.t('omniauth_callbacks.failure', kind: 'Github')

    #   redirect_to new_user_session_path
    # end
  end
end