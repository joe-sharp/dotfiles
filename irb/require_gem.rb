# frozen_string_literal: true

##
# Allows gems not present in the Gemfile to be used in irb/pry sessions
# Usage:
# require_relative 'require_gem'
# require_gem 'pry-doc'
#
class RequireGem
  def initialize
    @all_gems = `ls #{gem_dir}`.split
  end

  def gem_dir
    return @gem_dir if defined? @gem_dir

    gem_home = ENV['GEM_HOME'] || `gem env gempath`.split(':').last.chomp
    @gem_dir = File.join(gem_home, 'gems')
  end

  def latest_version(gem)
    latest = @all_gems.find { |g| g =~ /^#{gem}-\d/ }
    raise "#{gem} doesn't appear to be installed in #{gem_dir}" unless latest

    latest
  end

  def require_gem(gem)
    dir = File.join(gem_dir, latest_version(gem), 'lib')
    $LOAD_PATH << dir
    puts "Loaded #{dir}"

    require gem.to_s
    puts "Required #{gem}"
  rescue StandardError => e
    puts e
  end
end

RG = RequireGem.new

def require_gem(gem)
  RG.require_gem(gem)
end
