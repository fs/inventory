class User < ActiveRecord::Base
  include Pacecar

  has_and_belongs_to_many :roles
  has_many :units

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :invitable

  attr_accessible :full_name, :email, :password, :password_confirmation
  validates :full_name, :presence => true

  acts_as_reportable

  def full_name_with_email
    "#{self[:full_name]} (#{email})"
  end

  def deletable?
    units.count == 0
  end

  def has_role?(role_sym)
    return true if role_sym == :user && !new_record?
    return true if role_sym == :visitor && new_record?

    roles.any? { |r| r.name.underscore.to_sym == role_sym }
  end
end
