class Hydroponic < ApplicationRecord
  before_create :set_access_token

  belongs_to :greenhouse
  has_many :hydroponic_datas

  private

  def set_access_token
    self.token = generate_token
  end

  def generate_token
    loop do
      token = SecureRandom.hex(10)
      break token unless Hydroponic.where(token: token).exists?
    end
  end
end
