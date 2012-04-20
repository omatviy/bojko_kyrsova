class CreateNations < ActiveRecord::Migration
  def self.up
    create_table :nations do |t|
      t.string      :name, :null => false
      t.integer     :region_id, :default => nil
      t.integer     :display_order, :limit => 2, :default => nil
      t.string      :tel_code, :limit => 10, :default => nil 
    end
  end
  
  def self.down
    drop_table :nations
  end

end
