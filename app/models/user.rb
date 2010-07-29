class User < ActiveRecord::Base
  include Pacecar

  has_many :units

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :invitable

  attr_accessible :full_name, :email, :password, :password_confirmation
  validates :full_name, :presence => true
  

  def full_name_with_email
    "#{self[:full_name]} (#{email})"
  end

  def deletable?
    units.count == 0
  end

end
