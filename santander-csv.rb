#!/usr/bin/env ruby

# Santander "Excel" files are really HTML documents
# This converts ARGF to a CSV on stdout

require "bundler/inline"
require "csv"

gemfile do
  source 'https://rubygems.org'
  gem 'nokogiri'
end

doc = Nokogiri::HTML(ARGF)
cells = doc.css('tr').map {_1.css('td').map(&:content)}

cells.shift(3) # The first three rows are documentation

headers = cells.shift

cells.shift # Another row of blanks at the start
cells.pop # and the end

puts(CSV.generate do |csv|
  csv << headers
  cells.each {csv << _1}
end)
