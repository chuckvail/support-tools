#!/usr/bin/env ruby
require "mysql2"
#monitors the changesets

myquery = "select c.name, pc.company_id, po_id, po_line, po_release, pc.changeset, pc.updated_at
from push_changesets pc
inner join companies c on pc.company_id = c.id
inner join purchase_orders po on pc.purchase_order_id = po.id

where pc.success = 0 and pc.invalidated = 0
order by pc.updated_at DESC;"

#Connect to the database and load changesets into memory:
connect = Mysql2::Client.new(:host => "hostname", :username => "username", :password => "password", :database => "name_db")
result = connect.query(myquery)
result.each {  |x| puts x }
