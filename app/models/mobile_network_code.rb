class MobileNetworkCode < ActiveRecord::Base
  belongs_to :mcc, :class_name => MobileCountryCode.model_name, :foreign_key => "mobile_country_code_id"

  def after_initialize 
    self.status ||= -1
  end

  validates_presence_of :mobile_country_code_id, :message => "mobile country code must be present"
  validates_presence_of :operator_id, :message => "operator must be present"
  validates_presence_of :mnc, :message => "mnc must be present"
  validates_length_of :mnc, :in => 2..5, :message => "length of mcc must be 2..5"
  validates_format_of :mnc, :with => /^\d+$/, :message => "mnc must consist of digits"
  validates_uniqueness_of :mnc, :scope => [:mobile_country_code_id]


  def self.create_with_mcc_and_operator(mcc, operator, mobile_hash)
    mnc = mobile_hash[:mnc]
    raise "mnc is absent or empty #{mcc} #{operator}" if mnc.nil? || mnc.strip.empty?
    mnc = mnc.strip       

    raise "mcc is absent or empty" if mcc.nil? || mcc.strip.empty?
    mcc = mcc.strip

    raise "operator is absent or empty" if operator.nil? || operator.strip.empty?
    operator = operator.strip

    mcc_find = MobileCountryCode.find_by_mcc(mcc, :include =>[:mncs])
    raise "#{mcc} isn't found, edit mcc_data.rb" if mcc_find.nil?

    mnc_search = mcc_find.mncs.map{|m| m.mnc}.include?(mnc)
    if mnc_search
      puts "such mnc=#{mnc} with mcc=#{mcc} is in table"
      return
    end

    operator_find = Operator.find_by_name("#{operator}")
    raise "#{operator} isn't found, edit operators.sql" if operator_find.nil?

    mobile_hash[:mobile_country_code_id] = mcc_find.id
    mobile_hash[:operator_id] = operator_find.id
    mnc_create = MobileNetworkCode.create(mobile_hash)

  end


end
# == Schema Information
#
# Table name: mobile_network_codes
#
#  id                     :integer         not null, primary key
#  operator_id            :integer         not null
#  mobile_country_code_id :integer         not null
#  mnc                    :string(5)       not null
#  status                 :integer
#

