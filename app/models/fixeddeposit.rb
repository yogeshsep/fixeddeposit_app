class Fixeddeposit < ActiveRecord::Base
  attr_accessible :address, :age, :city, :customername, :dateofbirth, :depositamount, :gender, :interestamount, :maturitydate, :openedon, :periods, :rateofinterest
end
