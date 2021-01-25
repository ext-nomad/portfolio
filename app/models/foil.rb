class Foil < ApplicationRecord
  validates :url, presence: true, uniqueness: true, length: { minimum: 5, maximum: 50 }

  has_rich_text :description
  belongs_to :user
end
