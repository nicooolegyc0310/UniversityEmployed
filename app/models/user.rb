class User < ActiveRecord::Base
    has_secure_password
    has_many :applications
    has_many :opportunities, through: :applications
end
