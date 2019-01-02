#!/usr/bin/env ruby

#monitors the changesets

require "mysql2"

connect = Mysql2::Client.new(:host => "hostname", :username => "username", :password => "password", :database => "name_db")
result = connect.query("SELECT * FROM table_name")
result.each {  |x| puts x }
