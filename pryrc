# frozen_string_literal: true

puts "Loading #{__FILE__} ..." if ENV['RC_DEBUG']

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


module JSharp
  # Convenience Methods
  # include Rails Route/Views helpers
  def self.iv
    include ::ActionDispatch::Routing              # for named paths
    include ::Rails.application.routes.url_helpers # for named paths
    include ::ActionView::Helpers::UrlHelper       # for url_for
    puts 'Loaded Rails Route/View helpers'
  end

  def self.an_array
    (1..10).to_a
  end

  def self.a_hash
    { foo: 'Foo', bar: 'Bar', baz: 'Baz' }
  end

  def self.bench(repetitions = 1000, &block)
    Benchmark.bm { |b| b.report{ repetitions.times(&block) } }
    nil
  end
end

puts "Loaded #{__FILE__}!" if ENV['RC_DEBUG']
