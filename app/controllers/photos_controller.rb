class PhotosController < ApplicationController
  before_action :user_can_add_photo?, only: :create
  before_action :set_event

  def create
    unless signed_in?
      redirect_to @event, alert: t("event_mailer.photos.errors.not_authorized")
      return
    end
  
    if params[:photos].nil?
      redirect_to @event, alert: t("event_mailer.photos.errors.empty")
      return
    end

    new_photos = params[:photos].map do |photo|
      @event.photos.create(user: current_user, source: photo)
    end
    
    NotifySubscribersJob.perform_now(new_photos.first)
    #new_photos.map do |photo|
    #  NotifySubscribersJob.perform_later(photo)
      #PhotoNotifierJob.perform_later(all_emails, photo)
    #end
    #PhotoNotifierJob.perform_later(all_emails, photo)
    #notify_subscribers(new_photos)
    redirect_to @event
  end

  #def all_emails
  #  @event.subscriptions.map(&:user_email) + [@event.user.email] - [current_user&.email]
  #end
  #def notify_subscribers(new_photos)
  #  emails = (@event.subscribers.map(&:email) + 
  #              @event.subscriptions&.pluck(:user_email).compact +            
  #              [@event.user.email]) - 
  #              [new_photos.first.user.email]
  #  emails&.each do |email|
  #    EventMailer.photos(new_photos, email).deliver_now
  #  end
  #end

  def set_event
    @event = Event.find(params[:event_id])
  end
end
