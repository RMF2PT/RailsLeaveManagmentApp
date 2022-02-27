class Unit < ApplicationRecord
  validates :name, length: { in: 2..30 }, uniqueness: { case_sensitive: false }
  validates :short_name, length: { is: 2 }, uniqueness: { case_sensitive: false }
end
