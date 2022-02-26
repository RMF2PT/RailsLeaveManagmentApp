class Unit < ApplicationRecord
  validates :name, presence: true, length: { in: 2..30 }, uniqueness: { case_sensitive: false }
  validates :short_name, presence: true, length: { is: 2 }, uniqueness: { case_sensitive: false }
end
