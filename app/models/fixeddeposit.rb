class Fixeddeposit < ActiveRecord::Base
  attr_accessible :address, :age, :city, :customername, :dateofbirth, :depositamount, :gender, :interestamount, :maturitydate, :openedon, :periods, :rateofinterest


before_save :set_openedon    
  def set_openedon
    self.openedon = Date.today.strftime("%d/%m/%Y")
  end  

#before_save :calculate_age
  #def calculate_age
    #self.age = ((DateTime.now - self.dateofbirth)/365)
  #end

before_save :calculate_maturitydate
  def calculate_maturitydate
    self.openedon = Date.today
     case self.periods
      when 1..365
        self.maturitydate = self.openedon + 1.year
      when 366..730
        self.maturitydate = self.openedon + 2.years
      when 731..1095
        self.maturitydate = self.openedon + 3.years
      when 1096..1460
        self.maturitydate = self.openedon + 4.years
      when 1461..1825
        self.maturitydate = self.openedon + 5.years
      else
        self.maturitydate      
     end
  end

  #before_save :calculate_interestamount
  #def calculate_interestamount
    #self.interestamount = ((self.depositamount.round * self.rateofinterest)/12).round
  #end


  validates :customername, presence: true, format: { with: %r{^[A-Z][a-zA-Z\s]*} }

  validates :periods, presence: true  
  
  validates_inclusion_of :dateofbirth,
      :in => Date.civil(1900, 1, 1)..Date.today,
      :message => "Must be between 1900 and now"   

  validates :address, :city, :gender, :depositamount, presence: true

end

