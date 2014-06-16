class CreateInterestsetups < ActiveRecord::Migration
  def change
    create_table :interestsetups do |t|
      t.date :effectivefrom
      t.date :effectiveto

      t.timestamps
    end
  end
end
