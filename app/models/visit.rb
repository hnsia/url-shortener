class Visit < ApplicationRecord
  belongs_to :url

  def self.str_to_coords(str)
    str.split(', ').map { |coord| coord.to_f }
  end

  def self.coords_to_str(coords)
    coords.join(", ")
  end
end
