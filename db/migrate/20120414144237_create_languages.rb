class CreateLanguages < ActiveRecord::Migration
  def self.up
    create_table :languages do |t|
      t.string :iana_code, :limit => 10, :default => nil
      t.string :name, :null => false
      t.timestamps
    end

    add_index :languages, :name
  end

  def self.down
    drop_table :languages
  end
end
