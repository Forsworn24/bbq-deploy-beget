class PhotoNotifierJob < ApplicationJob
  queue_as :default

  def perform(all_emails, photo)
    all_emails.each { |email| EventMailer.photo(photo, email).deliver_now }
  end
end
