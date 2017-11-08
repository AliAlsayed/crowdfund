class Project < ApplicationRecord
	validates :name, presence: true, uniqueness: true
	validates :description, length: {maximum: 500}
	validates :target_pledge_amount, numericality: {greater_than: 0}
	validates :image_file_name, allow_blank: true, format: {
  	with:    /\w+\.(gif|jpg|png)\z/i,
  	message: "must reference a GIF, JPG, or PNG image"
	}

	has_many :pledges, dependent: :destroy

	def pledging_expired?
		Time.now > pledging_ends_on
	end

	def self.accepting
		where("pledging_ends_on > ?", Time.now)
	end

	def total_pledged
		total = 0
		pledges.each do |p|
			total += p['pledge_amount']
		end
		total
	end

	def pledge_outstanding
		target_pledge_amount - total_pledged
	end

	def fully_funded?
		pledge_outstanding <= 0
	end

end























