class Foil < ApplicationRecord
  validates :title, presence: true, uniqueness: true
  validates :description, presence: true, length: {minimum: 5, maximum: 50}

  has_rich_text :description
end
