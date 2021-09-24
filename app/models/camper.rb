class Camper < ApplicationRecord
  has_many :signups
  has_many :activities, through: :signups

  validates :name, presence: true
  validates :age, inclusion: 8..18
  # or inclusion: {within: 8..18}
  # or validates: age, numericality: {grater_than_or_equal_to: 9, less_than_or_equal_to: 18}


  def profile
    self.to_json(
        include: {activities: {except: [:created_at, :updated_at]}},
        except: [:created_at, :updated_at]
      )
  end

end
