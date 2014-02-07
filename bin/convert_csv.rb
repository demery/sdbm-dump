#!/usr/bin/env ruby

require 'roo'
require 'sqlite3'
require 'active_record'

# require all the ruby files in lib
Dir[File.expand_path('../../lib',__FILE__) + '/*.rb'].each { |f| require f }

csv = Roo::CSV.new File.expand_path('../../data/schoenbergAll.csv', __FILE__)
# csv = Roo::CSV.new File.expand_path('../../data/schoenbergSmall.csv', __FILE__)

puts "#{Time.now}: Now ready to get the info"
last_row = csv.last_row
width = last_row.to_s.size
puts "#{Time.now}: last_row: #{last_row}"
last_col = csv.last_column
puts "#{Time.now}: last_col: #{last_col}"

# get the attributes
ATTR_LIST = []
(1..last_col).each do |i|
  head = csv.cell(1,i).downcase
  ATTR_LIST << head.to_sym unless head == 'x'
end

ActiveRecord::Base.establish_connection(
  :adapter => 'sqlite3',
  :database => File.expand_path('../../db/test.sqlite3', __FILE__)
)

# fill the database
Observation.destroy_all

(2..last_row).each do |row|
  attrs = {}
  ATTR_LIST.each_with_index do |attr, index|
    attrs[attr] = csv.cell row, index+1
  end
  # remove empty strings
  attrs.reject! { |k,v| v == '' }
  Observation.new(attrs).save!
  if row % 1000 == 0 || row == last_row
    puts sprintf("%#{width}d of %#{width}d added -- %s",row,last_row, Time.now.to_s) 
  end
end