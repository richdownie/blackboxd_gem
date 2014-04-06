Gem::Specification.new do |s|
  s.name        = 'blackboxd'
  s.version     = '0.2.5'
  s.date        = '2014-04-06'
  s.summary     = "Cucumber and Webdriver Testing Steps"
  s.description = "Cucumber and Webdriver Testing Steps"
  s.authors     = ["Rich Downie"]
  s.email       = 'rich@blackboxd.com'
  s.add_runtime_dependency "cucumber"
  s.add_runtime_dependency "selenium-webdriver"
  s.add_runtime_dependency "rspec"
  s.files       = ["README.doc", "lib/blackboxd.rb"]
  s.homepage    = 'https://github.com/richdownie/blackboxd_gem'
  s.license     = 'MIT'
end