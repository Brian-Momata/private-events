class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :events, foreign_key: "creator_id", dependent: :destroy
  has_many :attended_events
  has_many :events, through: :attended_events, source: :attended_events_table_foreign_key_to_events_table
end
