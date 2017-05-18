Gem::Specification.new do |s|
  s.name = 'association_callbacks'
  s.version = File.read(File.dirname(__FILE__) + '/VERSION').strip
  s.platform = Gem::Platform::RUBY
  s.author = 'Alexis Toulotte'
  s.email = 'al@alweb.org'
  s.homepage = 'https://github.com/alexistoulotte/association_callbacks'
  s.summary = 'Callbacks for ActiveRecord associations'
  s.description = 'Provides a way to define callbacks of one ActiveRecord model into an associated one'
  s.license = 'MIT'

  s.files = `git ls-files | grep -vE '^(spec/|test/|\\.|Gemfile|Rakefile)'`.split("\n")
  s.executables = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ['lib']

  s.required_ruby_version = '>= 2.0.0'

  s.add_dependency 'activerecord', '>= 5.0.0', '< 5.1.0'
  s.add_dependency 'activesupport', '>= 5.0.0', '< 5.1.0'

  s.add_development_dependency 'byebug', '>= 3.2.0', '< 3.6.0'
  s.add_development_dependency 'rake', '>= 10.3.0', '< 10.5.0'
  s.add_development_dependency 'rspec', '>= 3.1.0', '< 3.2.0'
  s.add_development_dependency 'sqlite3-ruby', '>= 1.3.0', '< 1.4.0'
end
