# frozen_string_literal: true

class EventMailer < ApplicationMailer
  def subscription(subscription)
    @email = subscription.user_email
    @name = subscription.user_name
    @event = subscription.event

    mail to: @event.user.email
  end

  def comment(comment, email)
    @comment = comment
    @event = comment.event

    mail to: email
  end

  def photo(new_photo, email)
    @photo = new_photo
    @event = new_photo.event

    mail to: email
  end
end
