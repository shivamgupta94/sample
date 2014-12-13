class CreateRous < ActiveRecord::Migration
  def change
    create_table :rous do |t|
      t.integer :IMEI_no
      t.integer :Mobile_no

      t.timestamps
    end
  end
end
