Gem::Specification.new do |s| 
  s.name         = "oscar-movies"
  s.version      = "1.0.0"
  s.author       = "Ahmed Nadar"
  s.email        = "ahmednadar@gmail.com"
  s.summary      = "Plays and reviews movies"
  s.homepage     = "http://ahmednadar.github.io"
  s.description  = File.read(File.join(File.dirname(__FILE__), 'README'))
  
  s.files         = Dir["{bin,lib,spec}/**/*"] + %w(LICENSE README)
  s.test_files    = Dir["spec/**/*"]
  s.executables   = [ 'oscar' ]
  
  s.required_ruby_version = '>=1.9'
  s.add_development_dependency 'rspec'
end