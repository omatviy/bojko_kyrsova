# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts "Start of rake db:seed"
puts "Loading language data"
Language.load_csv_data('languages.csv',false,';')

puts "Loading geography"
LoadSql.load("geography.sql")

puts "Loading operator"
#Operator.load_csv_data('mnc.csv',false,';')
#MobileCountryCode.load_csv_data('mcc.csv',false,';')
#MobileNetworkCode.load_csv_data('mnc.csv',false,';')
LoadSql.load("operators.sql")

puts "Loading mcc"
#LoadSql.load("mobile_country_codes.sql")
MobileCountryCode.create_with_country("Ukraine", {:mcc => '255'})
#LoadSql.load("mobile_network_codes.sql")

puts "Loading mnc data"
mcc = MobileCountryCode.ukr_mccs.first
MobileNetworkCode.create_with_mcc_and_operator(mcc, "Golden Telecom", {:mnc => '039'})

MobileNetworkCode.create_with_mcc_and_operator(mcc, "MTS",{:mnc => '050'})
MobileNetworkCode.create_with_mcc_and_operator(mcc, "MTS",{:mnc => '066'})
MobileNetworkCode.create_with_mcc_and_operator(mcc, "MTS",{:mnc => '095'})
MobileNetworkCode.create_with_mcc_and_operator(mcc, "MTS",{:mnc => '099'})

MobileNetworkCode.create_with_mcc_and_operator(mcc, "life:)", {:mnc => '063'})
MobileNetworkCode.create_with_mcc_and_operator(mcc, "MTS",{:mnc => '093'})

MobileNetworkCode.create_with_mcc_and_operator(mcc, "Kyivstar", {:mnc => '067'})
MobileNetworkCode.create_with_mcc_and_operator(mcc, "Kyivstar", {:mnc => '096'})
MobileNetworkCode.create_with_mcc_and_operator(mcc, "Kyivstar", {:mnc => '097'})

MobileNetworkCode.create_with_mcc_and_operator(mcc, "Beeline", {:mnc => '068'})

MobileNetworkCode.create_with_mcc_and_operator(mcc, "Utel", {:mnc => '091'})

MobileNetworkCode.create_with_mcc_and_operator(mcc, "PEOPLEnet", {:mnc => '092'})

MobileNetworkCode.create_with_mcc_and_operator(mcc, "Intertelecom", {:mnc => '094'})

puts "End of rake db:seed"

