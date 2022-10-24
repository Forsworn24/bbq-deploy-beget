# frozen_string_literal: true

class Photo < ApplicationRecord
  belongs_to :event
  belongs_to :user

  has_one_attached :source
end
