class Language < ActiveRecord::Base
  validates_uniqueness_of :iana_code, :allow_nil => true, :allow_blank => false 
  validates_uniqueness_of :name, :allow_nil => false, :allow_blank => false

  def self.load_csv_data(fname, validate_only = false, separator = ";", first_row_header = true, truncate = true)
    fpath = File.join(RAILS_ROOT, SEED_DIR, fname)
    unless File.exists?(fpath)
      puts "File #{fpath} doesn't exist"
      return
    end
    #truncate_table if truncate
    data = FasterCSV.read(fpath, {:col_sep => separator, :headers => first_row_header})
    data.each do |row|
      iana_code = row[0]
      name = row[1]
      l1 = find_by_iana_code(iana_code)
      l2 = find_by_name(name)
      if validate_only
        puts "iana_code #{iana_code} #{l1.nil? ? 'missing' : 'found'}"
        puts "language  #{name} #{l2.nil? ? 'missing' : 'found'}"
        puts "ERROR: language #{name} and iana_code #{iana_code} not in same record" unless l1 == l2
      else
        raise "collision with either language #{name} and/or iana_code #{iana_code}" unless l1.nil? && l2.nil?
        language = new(:name => name, :iana_code => iana_code)
        raise "language save failed" unless language.save
      end
    end
    true
  end

  def self.english
    @@english ||= find_by_name("English")
  end

  def self.russian
    @@russian ||= find_by_name("Russian")
  end

  def self.ukrainian
    @@ukrainian ||= find_by_name("Ukrainian")
  end

end
