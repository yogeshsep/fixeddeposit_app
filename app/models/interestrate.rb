class Interestrate < ActiveRecord::Base
  attr_accessible :dayfrom, :dayto, :rate, :seniorincrement, :superseniorincrement, :widowincrement
end
