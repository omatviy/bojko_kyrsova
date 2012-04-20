class CreateMobileNetworkCodes < ActiveRecord::Migration
  def self.up
    create_table :mobile_network_codes do |t|
      t.integer :operator_id, :null =>false
      t.integer :mobile_country_code_id, :null =>false
      t.string  :mnc, :null =>false, :limit=> 5
      t.integer :status #, :limit => 1
    end
    add_index :mobile_network_codes, :mnc
    add_index :mobile_network_codes, :operator_id
    # don't add index to mcc_id, since field values won't vary much
  end

  def self.down
    drop_table :mobile_network_codes
  end
end
