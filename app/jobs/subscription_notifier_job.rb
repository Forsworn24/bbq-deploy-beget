class SubscriptionNotifierJob < ApplicationJob
  queue_as :default

  def perform(event, subscription)
    EventMailer.subscription(event, subscription).deliver_now
  end
end
