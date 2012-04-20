# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts "Loading language data"
Language.load_csv_data('languages.csv',false,';')

puts "Loading geography"
LoadSql.load("geography.sql")

puts "Loading operator, mcc and mnc data"
#Operator.load_csv_data('mnc.csv',false,';')
#MobileCountryCode.load_csv_data('mcc.csv',false,';')
#MobileNetworkCode.load_csv_data('mnc.csv',false,';')
LoadSql.load("operators.sql")
#LoadSql.load("mobile_country_codes.sql")
#LoadSql.load("mobile_network_codes.sql")


puts "End of rake db:seed"

