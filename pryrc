# frozen_string_literal: true

puts "Loading #{__FILE__} ..."

require '~/.config/irb/require_gem'
require_gem 'pry-doc'
require 'benchmark'

# Run last command with return
Pry::Commands.command /^$/, "repeat last command" do
  pry_instance.run_command Pry.history.to_a.last
end

Pry::Commands.command /^q$/, "quit" do
  pry_instance.run_command exit
end

# Convenience Methods
# include Rails Route/Views helpers
def iv
  include ActionDispatch::Routing              # for named paths
  include Rails.application.routes.url_helpers # for named paths
  include ActionView::Helpers::UrlHelper       # for url_for
  puts 'Loaded Rails Route/View helpers'
end

def an_array
  (1..10).to_a
end

def a_hash
  { foo: 'Foo', bar: 'Bar', baz: 'Baz' }
end

def bench(repetitions = 1000, &block)
  Benchmark.bm { |b| b.report{ repetitions.times(&block) } }
  nil
end

puts "Loaded #{__FILE__}!"
