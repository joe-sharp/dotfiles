# frozen_string_literal: true

puts 'Loading ~/.pryrc ...'
require 'pry-doc'

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
  require 'benchmark'
  Benchmark.bm { |b| b.report{ repetitions.times(&block) } }
  nil
end

puts 'Loaded ~/.pryrc'
