class Unit < ApplicationRecord
  # Unit references
  has_many :teams

  # Unit validations
  validates :name, length: { in: 2..30 }, uniqueness: { case_sensitive: false }
  validates :short_name, length: { is: 2 }, uniqueness: { case_sensitive: false }

  # Unit pretty attributes
  before_save :capitalize_attributes, :uppercase_attributes

  def leader
    main_team = Team.find_by(short_name: '--', unit_id: self.id)
    User.find(main_team.leader.id).name unless main_team.blank? or main_team.leader.blank?
  end

  private

  def capitalize_attributes
    capitalizable = ['name']
    attributes.each do |attr, val|
      send("#{attr}=", val.to_s.strip.capitalize) if capitalizable.include?(attr)
    end
  end

  def uppercase_attributes
    upcase_att = ['short_name']
    attributes.each do |attr, val|
      send("#{attr}=", val.to_s.strip.upcase) if upcase_att.include?(attr)
    end
  end
end
