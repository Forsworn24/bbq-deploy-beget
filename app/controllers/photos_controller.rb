# frozen_string_literal: true

class PhotosController < ApplicationController
  before_action :user_can_add_photo?, only: :create
  before_action :set_event

  def create
    unless signed_in?
      redirect_to @event, alert: t('event_mailer.photos.errors.not_authorized')
      return
    end

    if params[:photos].nil?
      redirect_to @event, alert: t('event_mailer.photos.errors.empty')
      return
    end

    new_photos = params[:photos].map do |photo|
      @event.photos.create(user: current_user, source: photo)
    end

    NotifySubscribersJob.perform_now(new_photos.first)
    redirect_to @event
  end

  def set_event
    @event = Event.find(params[:event_id])
  end
end
