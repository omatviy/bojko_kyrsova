class CreateMobileCountryCodes < ActiveRecord::Migration
  def self.up
    create_table :mobile_country_codes do |t|
      t.string  :mcc, :null => false, :limit => 5
      t.integer :nation_id, :null => false
      t.timestamps
    end
    add_index :mobile_country_codes, :mcc
    add_index :mobile_country_codes, :nation_id
  end

  def self.down
    drop_table :mobile_country_codes
  end

end
