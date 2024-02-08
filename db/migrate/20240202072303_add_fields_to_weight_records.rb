class AddFieldsToWeightRecords < ActiveRecord::Migration[7.0]
  def change
    change_table :weight_records do |t|
      t.float :previous_weight
      t.float :new_weight
      t.date :date
      t.float :weight_difference
    end
  end
end
