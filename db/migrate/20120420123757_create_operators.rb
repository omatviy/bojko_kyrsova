class CreateOperators < ActiveRecord::Migration
  def self.up
    create_table :operators do |t|
      t.string :name, :null => false      
      t.timestamps
    end
  end

  def self.down
    drop_table :operators
  end
end
