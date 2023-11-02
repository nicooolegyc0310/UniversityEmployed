class Application < ActiveRecord::Base
    belongs_to :user
    belongs_to :opportunity
    validates :status, presence: true, inclusion: { in: %w(pending approved rejected), message: "%{value} is not a valid status" }
  end
  