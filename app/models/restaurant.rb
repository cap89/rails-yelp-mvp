class Restaurant < ApplicationRecord
  # Associations
  has_many :reviews, dependent: :destroy

  # Validations
  validates :name, :address, :category, presence: true
  validates :category, inclusion: { in: ["chinese", "italian", "japanese", "french", "belgian"],
                                    message: "%{value} is not a valid category" }
  # Validation for phone_number format
  validates :phone_number, presence: true
end
