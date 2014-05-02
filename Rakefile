require 'rspec/core/rake_task'

task :default => :test

desc 'Run all specs'
RSpec::Core::RakeTask.new(:test) do |task|
  task.pattern = './spec/asrt/*_spec.rb'
  task.rspec_opts = '--require spec_helper'.split
end
