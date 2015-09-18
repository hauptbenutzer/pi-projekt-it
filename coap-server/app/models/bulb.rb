class Bulb < ActiveRecord::Base

  IP_ADDRESS = '10.0.1.104'

  validates :on, :brightness, :color, presence: :true
  validates :brightness, inclusion: 0..255
  validates :color, format: { with: /\A#([A-Fa-f0-9]{6}|[A-Fa-f0-9]{3})\z/i }

end
