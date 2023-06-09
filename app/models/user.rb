class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :events, foreign_key: "creator_id", dependent: :destroy
  has_many :attended_events, foreign_key: "attendee_id", dependent: :destroy
  # helps me retrieve the events where user is an attendee
  has_many :events_invited, through: :attended_events, source: :event
end
