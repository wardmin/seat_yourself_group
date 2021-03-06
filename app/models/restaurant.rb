class Restaurant < ActiveRecord::Base
	has_many :reservations, dependent: :destroy
	has_many :customers, through: :reservations
	has_and_belongs_to_many :food_types
  has_many :reviews
  has_many :customers, through: :reviewsphone_suffix
  has_one :gallery

	has_secure_password

  geocoded_by :full_street_address # can also be an IP address
  after_validation :geocode        # auto-fetch coordinates


	validates :name, presence: true
	validates :email, presence: true
  validates_uniqueness_of :email, :case_sensitive => false, :message => "That email is already taken."

  def available?(party_size, start_time)
  	reserved = reservations.where(start_date_time: start_time).sum(:party_size)
  	reserved + party_size <= capacity
  end

  mount_uploader :attachment, AttachmentUploader

  def full_street_address
    "#{address}, #{city}, #{province}, #{postal_code}"
  end

  def phone_number
    "(#{area_code}) #{phone_prefix}-#{phone_suffix}"
  end

  private
  def self.search(search)
    where("name LIKE ?", "%#{search}%")
  end

end
