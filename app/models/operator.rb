class Operator < ActiveRecord::Base
#  has_many :mobile_network_codes
  validates_presence_of :name
  validates_uniqueness_of :name
  validates_length_of :name, :in => 1..80, :message => "length of name must be 1..80"

  def self.create_with_name(name)
    raise "name is absent or empty" if name.nil? || name.strip.empty?
    name = name.strip
    op = find_by_name(name)
    return op unless op.nil?
    create(:name => name)
  end


end
