class Event < ApplicationRecord
  belongs_to :user
  validates :name, :date, :location, :state, presence: true
end
