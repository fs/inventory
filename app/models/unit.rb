class Unit < ActiveRecord::Base
  belongs_to :user

  validates :inv_id, :presence => true, :uniqueness => true, :numericality => true
  validates :name, :presence => true
  validates :description, :presence => true
  validates :unit_type, :presence => true
  validates :room, :presence => true
  validates :user_id, :presence => true

  def place
    on_depot? ? 'on depot' : "in #{room} owned by #{user.full_name_with_email}"
  end
end
