class Interestrate < ActiveRecord::Base

  belongs_to :interestsetup

  attr_accessible :dayfrom, :dayto, :rate, :seniorincrement, :superseniorincrement, :widowincrement
end
