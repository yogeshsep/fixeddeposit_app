class Interestsetup < ActiveRecord::Base
 
  has_many :interestrates

  attr_accessible :effectivefrom, :effectiveto
end
