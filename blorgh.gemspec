$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "blorgh/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "blorgh"
  s.version     = Blorgh::VERSION
  s.authors     = ["liuchunliang"]
  s.email       = ["Chunliang.Liu@abcam.com"]
  s.homepage    = "http://blog.liu_xiaodao.top"
  s.summary     = "Tet Engine"
  s.description = "Tet Engine."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 5.1"
  s.add_dependency "rest-client"

  s.add_development_dependency "sqlite3"
end
