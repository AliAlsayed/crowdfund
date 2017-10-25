class Project < ApplicationRecord
	validates :name, presence: true, uniqueness: true
	validates :description, length: {maximum: 500}
	validates :target_pledge_amount, numericality: {greater_than: 0}
	validates :image_file_name, allow_blank: true, format: {
  	with:    /\w+\.(gif|jpg|png)\z/i,
  	message: "must reference a GIF, JPG, or PNG image"
	}

	has_many :pledges, dependent: :destroy
end

	def pledging_expired?
		Time.now > pledging_ends_on
	end
	def self.accepting
		where("pledging_ends_on > ?", Time.now)
	end
end
