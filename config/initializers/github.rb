use OmniAuth::Builder do
  provider :github, Rails.application.credentials.dig(:omniauth, :github, :id), 
    Rails.application.credentials.dig(:omniauth, :github, :secret), scope: 'read:user, user:email'
end
