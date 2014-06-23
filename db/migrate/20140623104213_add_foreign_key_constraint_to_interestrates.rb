class AddForeignKeyConstraintToInterestrates < ActiveRecord::Migration
  def change
    add_column :interestrates, :interestsetup_id, :integer
  end
end
