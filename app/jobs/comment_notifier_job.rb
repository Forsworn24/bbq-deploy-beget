class CommentNotifierJob < ApplicationJob
  queue_as :default

  def perform(all_emails, comment)
    all_emails.each { |email| EventMailer.comment(comment, email).deliver_now }
  end
end
