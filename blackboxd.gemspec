Gem::Specification.new do |s|
  s.name        = 'blackboxd'
  s.version     = '0.2.9'
  s.date        = '2014-05-09'
  s.summary     = "Cucumber and Webdriver Testing Steps"
  s.description = "Cucumber and Webdriver Testing Steps"
  s.authors     = ["Rich Downie"]
  s.email       = 'rich@blackboxd.com'
  s.add_runtime_dependency "cucumber"
  s.add_runtime_dependency "selenium-webdriver"
  s.add_runtime_dependency "rspec"
  s.files       = ["README.rdoc", "lib/blackboxd.rb"]
  s.homepage    = 'http://blackboxd.com/screencasts'
  s.license     = 'MIT'
end