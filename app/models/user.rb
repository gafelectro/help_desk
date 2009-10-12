class User < ActiveRecord::Base
  acts_as_authentic do |c|

c.ignore_blank_passwords=false
c.validate_password_field= false

end		    
  validates_length_of :login, :within => 3..30
  validates_format_of :login, :with => /\A[-a-z0-9\.]*\Z/
  validates_format_of :email, :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/
  #validates_confirmation_of :password
  
  has_many :user_categories
  has_many :categories, :through => :user_categories
  has_many :tickets
  has_many :tickets_incharge, :class_name => 'Ticket', :foreign_key => 'user_incharge_id'


  has_many :comments
end
