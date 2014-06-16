class CreateFixeddeposits < ActiveRecord::Migration
  def change
    create_table :fixeddeposits do |t|
      t.string :customername
      t.date :dateofbirth
      t.string :gender
      t.text :address
      t.string :city
      t.date :openedon
      t.float :depositamount
      t.date :maturitydate
      t.float :interestamount
      t.float :rateofinterest
      t.integer :periods
      t.integer :age

      t.timestamps
    end
  end
end
