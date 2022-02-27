class Unit < ApplicationRecord
  has_many :teams
  
  validates :name, length: { in: 2..30 }, uniqueness: { case_sensitive: false }
  validates :short_name, length: { is: 2 }, uniqueness: { case_sensitive: false }

  before_save :capitalize_attributes, :uppercase_attributes

  private
  def capitalize_attributes
    capitalizable = ["name"]
    self.attributes.each do |attr,val|
    self.send("#{attr}=",val.to_s.strip.capitalize) if capitalizable.include?(attr)
    end
  end
  def uppercase_attributes
    upcase_att = ["short_name"]
    self.attributes.each do |attr,val|
    self.send("#{attr}=",val.to_s.strip.upcase) if upcase_att.include?(attr)
    end
  end
end
