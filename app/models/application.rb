class Application < ActiveRecord::Base
    belongs_to :user
    belongs_to :opportunity
    validates :status, presence: true, inclusion: { in: %w(pending approved rejected), message: "%{value} is not a valid status" }
      # Add the following lines for the new columns
    #validates :application_text, presence: true
    #validates :resume, presence: true
  end
  