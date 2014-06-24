class Interestsetup < ActiveRecord::Base
 
  has_many :interestrates

  accepts_nested_attributes_for :interestrates

  attr_accessible :effectivefrom, :effectiveto, :interestrates_attributes

  validates :effectivefrom, presence: true
  
end
