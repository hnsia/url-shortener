class Url < ApplicationRecord
    has_many :visits, dependent: :destroy

    validates :target_url, presence: true, :format => {:with => URI.regexp}
    validates :shortened_key, presence: true, uniqueness: true, length: { in: 10..15 }
end
