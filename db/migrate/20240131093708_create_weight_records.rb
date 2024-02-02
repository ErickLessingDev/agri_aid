class CreateWeightRecords < ActiveRecord::Migration[7.0]
  def change
    create_table :weight_records do |t|
      t.float :weight
      t.datetime :recorded_at
      t.references :cattle, null: false, foreign_key: true

      t.timestamps
    end
  end
end
