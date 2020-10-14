class HydroponicData < ApplicationRecord
  belongs_to :hydroponic

  def self.hydroponic_param(id, param)
    where(hydroponic_id: id).collect { |p| [p.created_at.strftime('%d/%m %H:%M'), p.public_send(param)] }
  end
end
