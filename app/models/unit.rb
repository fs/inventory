class Unit < ActiveRecord::Base
  include Pacecar

  belongs_to :user
  belongs_to :room

  validates :inv_id, :presence => true, :uniqueness => true, :numericality => true
  validates :name, :presence => true
  validates :description, :presence => true
  validates :unit_type, :presence => true
  validates :room_id, :presence => true
  validates :user_id, :presence => true

  before_validation :generate_next_inv_id

  has_state :unit_type, :with => APP_CONFIG['unit_types']

  def inv_id_with_name
    "##{inv_id}, #{name}"
  end

  def generate_next_inv_id
    if inv_id.blank?
      self.inv_id = self.class.maximum(:inv_id).to_i + 1
    end
  end
end
