class Restaurant < ActiveRecord::Base
	has_many :reservations, dependent: :destroy
	has_many :customers, through: :reservations
	has_and_belongs_to_many :food_types

	has_secure_password

	validates :name, presence: true
	validates :email, presence: true
  #validates_uniqueness_of :email, :case_sensitive => false, :message => "That email is already taken."

  private
  def self.search(search)
    where("name LIKE ?", "%#{search}%")
  end

end
