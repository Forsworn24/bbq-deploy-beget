class EventMailer < ApplicationMailer
  def subscription(subscription)
    @email = subscription.user_email
    @name = subscription.user_name
    @event = subscription.event

    mail to: @event.user.email
    #mail to: @event.user.email, subject: "Новая подписка на #{@event.title}"
  end

  def comment(comment, email)
    @comment = comment
    @event = comment.event

    mail to: email
    #mail to: email, subject: "Новый комментарий @ #{@event.title}"
  end

  def photo(new_photo, email)
    @photo = new_photo
    @event = new_photo.event

    mail to: email
    #mail to: email, subject: "Новые фотографии в событии #{@event.title}"
  end
end
