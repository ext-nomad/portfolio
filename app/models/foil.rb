class Foil < ApplicationRecord
  validates :url, presence: true, uniqueness: true, length: { minimum: 5, maximum: 50 }

  has_rich_text :description
  belongs_to :user

  def to_s
    "http://www.#{url}/"
  end

  def capture
    ws = Webshot::Screenshot.instance
    ws.capture(to_s, "app/assets/images/#{url}.png") do |magic|
      magic.combine_options do |c|
        # c.thumbnail '1000x'
        # c.background 'white'
        # c.extent '1920x1080'
        # c.timeout 0.5
        # c.delay 0.2
        c.quality 90
        c.scale(-1)
      end
    end
  end
end
