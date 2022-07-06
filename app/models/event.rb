class Event < ApplicationRecord
  belongs_to :user
  belongs_to :field
  has_one_attached :photo

  def booked?(user)
    Reservation.find_by(user: user, event: self)
  end

  def remaining_places
    reservations = Reservation.where(event: self)
    reservations.length
  end

  def participants
    re
  end
end
