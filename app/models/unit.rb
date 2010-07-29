class Unit < ActiveRecord::Base
  include Pacecar

  belongs_to :user
  belongs_to :room

  validates :inv_id, :presence => true, :uniqueness => true, :numericality => true
  validates :name, :presence => true
  validates :unit_type, :presence => true
  validates :room_id, :presence => true
  validates :user_id, :presence => true

  before_validation :generate_next_inv_id
  before_save :reassign_user_if_on_depot

  default_scope order('inv_id')

  def inv_id_with_name
    "##{inv_id}, #{name}"
  end

  def generate_next_inv_id
    if inv_id.blank?
      self.inv_id = self.class.maximum(:inv_id).to_i + 1
    end
  end

  def reassign_user_if_on_depot
    if on_depot?
      self.user = User.admin.first
    end
  end

  def assign_to_user!(user)
    self.on_depot = false
    self.user = user
    save
  end

  def place_on_depot!
    self.on_depot = true
    save
  end

  def css_class
    unit_type.parameterize
  end
end
