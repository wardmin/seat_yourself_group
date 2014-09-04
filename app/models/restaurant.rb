class Restaurant < ActiveRecord::Base
	has_many :reservations, dependent: :destroy
	has_many :customers, through: :reservations

	has_secure_password

	validates :name, presence: true
	validates :email, presence: true
end
