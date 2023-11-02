class Opportunity < ActiveRecord::Base
    has_many :applications
    has_many :users, through: :applications
    # Ensure that the capacity is always present and is a positive number
    validates :capacity, presence: true, numericality: { only_integer: true, greater_than: 0 }
end
