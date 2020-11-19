$:.push File.expand_path("lib", __dir__)

# Maintain your gem's version:
require "admin_dashboard/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |spec|
  spec.name        = "admin_dashboard"
  spec.version     = AdminDashboard::VERSION
  spec.authors     = ["condef5"]
  spec.email       = ["frankcondezo@gmail.com"]
  spec.homepage    = "http://condef5.com"
  spec.summary     = "Summary of Admin::Dashboard."
  spec.description = "Description of Admin::Dashboard."
  spec.license     = "MIT"


  spec.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  spec.add_dependency "rails", "~> 6.0.3", ">= 6.0.3.4"
  spec.add_dependency "godmin", "~> 2.0.0"
  spec.add_dependency "clearance"
end
