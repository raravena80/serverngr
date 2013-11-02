# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Server.create(:customer_name => 'Robert Sosa',
              :customer_email => 'robert.sosa@serverbooter.com',
              :server_name => 'robert-sosa.serverbooter.com',
              :server_id => 'i-3232232',
              :server_type => 'm1.large',
              :server_public_ipaddress => '50.56.245.1',
              :server_private_ipaddress => '10.32.123.1',
              :server_account => '231442342343243',
              :server_password => 'r3rewfsefsafasccadsf',
              :server_status => 'Running')

Server.create(:customer_name => 'Mark Johnson',
              :customer_email => 'mark.johnson@serverbooter.com',
              :server_name => 'mark-johnson.serverbooter.com',
              :server_id => 'i-3232233',
              :server_type => 'm2.2xlarge',
              :server_public_ipaddress => '50.56.245.2',
              :server_private_ipaddress => '10.32.123.2',
              :server_account => '231442342343244',
              :server_password => 'asdawfsefsafasccadsf',
              :server_status => 'Starting')

Server.create(:customer_name => 'Rose Smith',
              :customer_email => 'rose.smith@serverbooter.com',
              :server_name => 'rose-smith.serverbooter.com',
              :server_id => 'i-3232234',
              :server_type => 'm1.large',
              :server_public_ipaddress => '50.56.245.1',
              :server_private_ipaddress => '10.32.123.1',
              :server_account => '231442342343244',
              :server_password => 'r3rewfsefsafasccadsf',
              :server_status => 'Running')

Server.create(:customer_name => 'Leo Versace',
              :customer_email => 'leo.versace@serverbooter.com',
              :server_name => 'leo-versace.serverbooter.com',
              :server_id => 'i-3232235',
              :server_type => 'm1.large',
              :server_public_ipaddress => '50.56.245.4',
              :server_private_ipaddress => '10.32.123.4',
              :server_account => '231442342343245',
              :server_password => 'r3rewfsefsafasccadsf',
              :server_status => 'Running')
