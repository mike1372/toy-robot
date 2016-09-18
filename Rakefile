require 'rake/testtask'

task :default => :run

task :test do
	Rake::TestTask.new do |t|
	  t.libs = ["lib"]
	  t.warning = true
	  t.verbose = true
	  t.test_files = FileList['spec/*_spec.rb']
	end
end

task :run do
	ruby 'lib/main.rb'
end
