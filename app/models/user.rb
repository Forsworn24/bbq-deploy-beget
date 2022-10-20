class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable,
    :omniauthable, omniauth_providers: %i[github]

  has_many :events, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :subscriptions, dependent: :destroy
  
  has_one_attached :avatar

  validates :name, presence: true, length: {maximum: 35}

  after_commit :link_subscriptions, on: :create

  def self.find_for_github_oauth(access_token)
    data = access_token.info
    user = User.where(email: data['email']).first

    # Uncomment the section below if you want users to be created if they don't exist
    unless user
        user = User.create(name: data['name'],
           email: data['email'],
           password: Devise.friendly_token[0,20]
        )
    end
    user
    # debugger

    # email = access_token.info.email
    # name = access_token.info.name
    # user = where(email: email).first

    # return user if user.present?

    # provider = access_token.provider
    # uid = access_token.uid

    # where(uid: uid, provider: provider).first_or_create! do |user|
    #   user.email = email
    #   user.name = name
    #   user.password = Devise.friendly_token.first(16)
    # end
  end

  private

  def link_subscriptions
    Subscription.where(user_id: nil, user_email: self.email)
      .update_all(user_id: self.id)
  end

  def send_devise_notification(notification, *args)
    devise_mailer.send(notification, self, *args).deliver_later
  end
end
