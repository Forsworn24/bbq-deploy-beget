class EventMailer < ApplicationMailer
  def subscription(event, subscription)
    @email = subscription.user_email
    @name = subscription.user_name
    @event = event

    mail to: event.user.email, subject: "Новая подписка на #{event.title}"
  end

  def comment(event, comment, email)
    @comment = comment
    @event = event

    mail to: email, subject: "Новый комментарий @ #{event.title}"
  end

  def photo(new_photo, email)
    @photo = new_photo
    @event = new_photo.event

    mail to: email, subject: "Новые фотографии в событии #{@event.title}"
  end

  #def photos(new_photos, email)
  #  @photos = new_photos
  #  @event = new_photos.first.event
  #
  #  mail to: email, subject: "Новые фотографии в событии #{@event.title}"
  #end
end
