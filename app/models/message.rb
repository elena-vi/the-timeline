class Message < ApplicationRecord
  validates :message, presence: true, length: { maximum: 150 }
end
