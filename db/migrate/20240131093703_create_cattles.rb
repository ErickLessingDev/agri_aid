class CreateCattles < ActiveRecord::Migration[7.0]
  def change
    create_table :cattles do |t|
      t.string :eid
      t.float :weight
      t.date :birthdate

      t.timestamps
    end
  end
end
