class CreateInterestrates < ActiveRecord::Migration
  def change
    create_table :interestrates do |t|
      t.integer :dayfrom
      t.integer :dayto
      t.float :rate
      t.float :seniorincrement
      t.float :superseniorincrement
      t.float :widowincrement

      t.timestamps
    end
  end
end
