class Meetup < ActiveRecord::Base
  has_many :attendees
  has_many :users,
  through: :attendees

  validates :title, presence: true
  validates :description, presence: true
  validates :date, presence: true
  validates :location, presence: true
  validates :time, presence: true
end
