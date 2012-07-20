Gem::Specification.new do |s|
  s.name = 'association_callbacks'
  s.version = File.read(File.expand_path(File.dirname(__FILE__) + '/VERSION')).strip
  s.platform = Gem::Platform::RUBY
  s.author = 'Alexis Toulotte'
  s.email = 'al@alweb.org'
  s.homepage = 'https://github.com/alexistoulotte/association_callbacks'
  s.summary = 'Callbacks for ActiveRecord associations'
  s.description = 'Provides a way to define callbacks of one ActiveRecord model into an associated one'

  s.rubyforge_project = 'association_callbacks'

  s.files = `git ls-files`.split("\n")
  s.test_files = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ['lib']

  s.add_dependency 'activerecord', '~> 3.2.0'
  s.add_dependency 'activesupport', '~> 3.2.0'

  s.add_development_dependency 'rake', '~> 0.9.2.2'
  s.add_development_dependency 'rspec', '~> 2.10.0'
  s.add_development_dependency 'sqlite3-ruby', '~> 1.3.0'
end
