#!/usr/bin/env ruby

require 'csv'
require 'sqlite3'
require 'active_record'
# require all the ruby files in lib
Dir[File.expand_path('../../lib',__FILE__) + '/*.rb'].each { |f| require f }

def usage
  puts "Usage: #{File.basename(__FILE__)} CSV_FILE"
end

csv_file = ARGV.shift
unless csv_file && File.exists?(csv_file)
  puts "Can't find CSV_FILE: '#{csv_file}'"
  usage
  exit 1
end

db_file  = File.expand_path '../../db/sdbm_dump.sqlite3', __FILE__
if File.exists?(db_file)
  puts "Deleting existing database: #{db_file}"
  File.delete db_file
end

# The object we save to the database
class Observation < ActiveRecord::Base; end

# create the database
ActiveRecord::Base.establish_connection(
  :adapter => 'sqlite3',
  :database => db_file
)
# create the table
CreateObservations.new.change
puts "Created database: #{db_file}"

count = 0
# get the file count
last_row = %x( wc -l #{csv_file} ).strip.split[0].to_i - 1
CSV.new(File.open(csv_file, 'r'), headers: true).lazy.each do |row|
  attrs = row.headers.inject({}) { |hash,h| 
    hash[h.downcase.to_sym] = row[h]; hash
  }
  Observation.new(attrs).save!
  if count % 1000 == 0 || row == last_row
    puts sprintf("%7d of c. %d added -- %s",count,last_row,Time.now.to_s)
  end
  count += 1
end 
puts sprintf("%7d of %7d added -- %s",count,count,Time.now.to_s)