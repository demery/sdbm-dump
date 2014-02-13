#!/usr/bin/env ruby

require 'csv'
require 'sqlite3'
require 'active_record'

# require all the ruby files in lib
Dir[File.expand_path('../../lib',__FILE__) + '/*.rb'].each { |f| require f }

# csv    = Roo::CSV.new File.expand_path('../../data/schoenbergAll.csv', __FILE__)
# csv    = Roo::CSV.new File.expand_path('../../data/schoenbergSmall.csv', __FILE__)
csv_file = ARGV.shift
db_file  = File.expand_path('../../db/sdbm_dump.sqlite3', __FILE__)

File.delete db_file if File.exists?(db_file)

class Observation < ActiveRecord::Base; end

ActiveRecord::Base.establish_connection(
  :adapter => 'sqlite3',
  :database => db_file
)

CreateObservations.new.change

width = 7
count = 0
last_row = %x( wc -l #{csv_file} ).strip.split[0].to_i - 1
CSV.new(File.open(csv_file, 'r'), headers: true).lazy.each do |row|
  attrs = row.headers.inject({}) { |hash,h| 
    hash[h.downcase.to_sym] = row[h]; hash
  }
  Observation.new(attrs).save!
  if count % 1000 == 0 || row == last_row
    puts sprintf("%7d of c. %7d added -- %s",count,last_row, Time.now.to_s)
  end
  count += 1
end 
puts sprintf("%7d of c. %7d added -- %s",count,last_row, Time.now.to_s)