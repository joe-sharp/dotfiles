#!/usr/bin/env ruby
# frozen_string_literal: true

require 'date'

QUIT_DATE_FILE = '/Users/joesharp/.config/neofetch/quit_date.txt'
JUUL_COST = 6
CIG_COST = 8
delta = 0

today = DateTime.now
File.open(QUIT_DATE_FILE, 'r') do |file|
  quit_date = DateTime.parse(file.read)
  delta = (today - quit_date).to_i
end

def add_commas(num_string)
  num_string = num_string.to_s if num_string.is_a?(Integer)
  num_string.reverse.scan(/\d{3}|.+/).join(',').reverse
end

juul_total = add_commas(delta * JUUL_COST)
cig_total = add_commas(delta * CIG_COST)

puts "It has been #{delta} days since you quit smoking!"
puts "You have saved between $#{juul_total} and $#{cig_total} since you quit!"
