# frozen_string_literal: true

# module Users
#   class OmniauthCallbacksController < Devise::OmniauthCallbacksController
#     def google_oauth2
#       handle_auth('Google')
#     end

#     def github
#       handle_auth('Github')
#     end

#     def handle_auth(kind)
#       @user = User.find_for_oauth(request.env['omniauth.auth'])

#       if @user.persisted?
#         flash[:notice] = I18n.t('devise.omniauth_callbacks.success', kind: kind)

#         sign_in_and_redirect @user, event: :authentication
#       else
#         flash[:error] = I18n.t('omniauth_callbacks.failure', kind: kind)

#         redirect_to new_user_session_path
#       end
#     end
#   end
# end

class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def github
    auth('GitHub')
  end

  def google_oauth2
    auth('Google')
  end

  def auth(kind)
    @user = User.find_for_oauth(request.env['omniauth.auth'])

    if @user.persisted?
      flash[:notice] = I18n.t('devise.omniauth_callbacks.success', kind: kind)
      
      sign_in_and_redirect @user, event: :authentication
    else
      flash[:error] = I18n.t('omniauth_callbacks.failure', kind: kind)

      redirect_to new_user_session_path
    end
  end
end
