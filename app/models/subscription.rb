class Subscription < ApplicationRecord
  belongs_to :event
  belongs_to :user, optional: :true

  validates :event, presence: true

  with_options unless: -> { user.present? } do
    validates :user_name, presence: true
    validates :user_email, presence: true, format: /\A[a-zA-Z0-9\-_.]+@[a-zA-Z0-9\-_.]+\z/
    validates :user_email, uniqueness: {scope: :event_id}
    validate :current_email_already_use
  end

  with_options if: -> { user.present? } do
    validates :user, uniqueness: {scope: :event_id}
    validate :author_event_cant_subscribe
  end

  def user_name
    if user.present?
     user.name
    else
     super
    end
  end
  
  def user_email
    if user.present?
      user.email
    else
      super
    end
  end

  private

  def author_event_cant_subscribe
    if event.user.id == user_id
      errors.add(:user_id, :error_subscribe_on_yourself)
    end
  end

  def current_email_already_use
    if User.exists?(email: user_email)
      errors.add(:user_email, :error_use_email)
    end
  end
end
