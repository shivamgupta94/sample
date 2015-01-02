class Changecol < ActiveRecord::Migration
  def change
  	rename_column :markers, :long, :lon
  end
end
