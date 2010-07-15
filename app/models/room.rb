class Room < ActiveRecord::Base
  validates :name, :presence => true, :uniqueness => true
  has_many :units

  def deletable?
    units.size == 0
  end
end
