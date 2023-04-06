class Event < ApplicationRecord
  belongs_to :creator, class_name: "User"
  has_many :attended_events, dependent: :destroy
  has_many :attendees, through: :attended_events

  scope :past, -> { where("date < ?", DateTime.now)}
  scope :future, -> { where("date > ?", DateTime.now)}
end
