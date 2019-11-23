require 'bundler/gem_tasks'
require 'rspec/core/rake_task'

gem 'simplecov'

RSpec::Core::RakeTask.new(:spec)

task :default => :spec

desc 'Run spec with coverage'
task :coverage do
  ENV['COVERAGE'] = '1'
  Rake::Task['spec'].execute
end
