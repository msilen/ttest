class CreateLots < ActiveRecord::Migration
  def change
    create_table :lots do |t|
      t.datetime :endtime
      t.boolean :status

      t.timestamps
    end
  end
end
