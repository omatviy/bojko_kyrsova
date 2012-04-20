class Nation < ActiveRecord::Base
  #has_many :people
  has_many :mccs, :class_name => MobileCountryCode.model_name
  has_many :mncs, :class_name => MobileNetworkCode.model_name, :through => :mccs

  def after_initialize #:every_time_init
    self.display_order ||= 2
  end

  def cc
    tel_code
  end

  def ukr?
    self.id == Nation.ukr.id
  end

  def self.ukr
    @@ukr ||= find_by_name("Ukraine", :include => [:mccs, :mncs]) #using eager loading to improve performance
    #@@ukr ||= find_by_name("Ukraine") #using eager loading to improve performance    
    raise "Ukraine not initialized" if @@ukr.nil? || @@ukr.tel_code.nil?
    @@ukr
  end


end
# == Schema Information
#
# Table name: nations
#
#  id            :integer         not null, primary key
#  name          :string(255)     not null
#  region_id     :integer
#  display_order :integer(2)
#  tel_code      :string(10)
#

