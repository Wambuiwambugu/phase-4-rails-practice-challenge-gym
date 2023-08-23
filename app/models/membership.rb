class Membership < ApplicationRecord
  belongs_to :gym
  belongs_to :client

  validates :client_id, uniqueness: { scope: :gym_id, message: "has already been taken for this gym" }
  validates :gym_id, :client_id, :charge, presence: true
end
