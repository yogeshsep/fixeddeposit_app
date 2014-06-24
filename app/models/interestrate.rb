class Interestrate < ActiveRecord::Base

  belongs_to :interestsetup

  attr_accessible :dayfrom, :dayto, :rate, :seniorincrement, :superseniorincrement, :widowincrement, :interestsetup_id

  validates :dayfrom, :dayto, :rate, :seniorincrement, :superseniorincrement, :widowincrement , presence: true
  
end
