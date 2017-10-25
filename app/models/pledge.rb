class Pledge < ApplicationRecord
  validates :name, presence: true
  validates :email, format: {with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/}
  ALLOWED_AMOUNTS = [25, 50, 100, 200, 500]
  validates :pledge_amount, inclusion: {in: ALLOWED_AMOUNTS}
  belongs_to :project
end
