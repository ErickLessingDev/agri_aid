class RemoveColumnsFromWeightRecords < ActiveRecord::Migration[7.0]
  def change
    remove_column :weight_records, :weight
    remove_column :weight_records, :date
    # Remove other existing columns if needed
  end
end
