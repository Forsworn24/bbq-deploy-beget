# frozen_string_literal: true

module EventsHelper
  def event_photo(photo, user)
    link_to (image_tag photo.variant(resize_to_fill: [300, 300]),
                       class: 'img-fluid example-image mt-2 border border-2 rounded-3 border-dark'),
            rails_blob_url(photo),
            data: { lightbox: 'example-set', title: t('upload.upload_user') + user.name }
  end

  def user_can_add_photo?(event)
    current_user == event.user || event.subscribers.include?(current_user)
  end
end
