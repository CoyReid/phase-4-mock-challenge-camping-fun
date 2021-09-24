class Signup < ApplicationRecord
  belongs_to :camper
  belongs_to :activity

  validates :time, inclusion: {within: 0..23}
  # or numericality: {greater_than_or_equal_to: 0, less_than_or_equal_to: 24}
end
