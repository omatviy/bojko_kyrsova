class MobileCountryCode < ActiveRecord::Base
  belongs_to :nation
  has_many   :mncs, :class_name => MobileNetworkCode.model_name

  validates_presence_of :nation_id, :message => "nation must be present"
  validates_presence_of :mcc, :message => "mcc must be present"
  validates_length_of :mcc, :in => 3..5, :message => "length of mcc must be 3..5"
  validates_format_of :mcc, :with => /^\d+$/, :message => "mcc must consists of digits"
  validates_uniqueness_of :mcc, :message => "mcc must be unique"

  def self.create_with_country(country,mobile_hash)
    mcc = mobile_hash[:mcc]
    raise "mcc is absent or empty" if mcc.nil? || mcc.strip.empty?
    mcc = mcc.strip

    mcc_find = find_by_mcc(mcc)
    if mcc_find
      puts "such mcc=#{mobile_hash[:mcc]} is in table"
      return mcc_find
    end

    raise "country name is absent or empty" if country.nil? || country.strip.empty?
    country = country.strip
    nation = Nation.find_by_name("#{country}")
    raise "#{country} isn't found, edit geography.sql" if nation.nil?

    mobile_hash[:nation_id] = nation.id
    mobile = create(mobile_hash)
    mobile
  end


  def self.ukr_mccs
    @@ukr_mccs ||= Nation.ukr.mccs.map(&:mcc)
  end

end
# == Schema Information
#
# Table name: mobile_country_codes
#
#  id         :integer         not null, primary key
#  mcc        :string(5)       not null
#  nation_id  :integer         not null
#  created_at :datetime
#  updated_at :datetime
#

