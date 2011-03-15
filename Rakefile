require 'bundler/setup'
require 'rake/clean'
require 'rspec/core/rake_task'

Bundler::GemHelper.install_tasks
CLOBBER.include "pkg"

task :default => ['spec:rcov', :build]

RSpec::Core::RakeTask.new

namespace :spec do
  desc "Run RSpec code examples with RCov"
  RSpec::Core::RakeTask.new(:rcov) do |task|
    task.rcov      = true
    task.rcov_opts = ["--failure-threshold 100", "--exclude spec/*,gems/*"]
  end
end
