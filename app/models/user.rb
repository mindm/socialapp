# == Schema Information
#
# Table name: users
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  email      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class User < ActiveRecord::Base
  attr_accessor :password
  attr_accessible :name, :email, :password, :password_confirmation
  
  validates :name,  :presence => true,
                    :length => { :maximum => 40 },
                    :uniqueness => true
  validates :email, :presence => true,
                    :uniqueness => true
  validates :password,  :presence => true,
                        :confirmation => true,
                        :length => { :within => 6..30}
end
