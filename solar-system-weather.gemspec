#require_relative 'lib'

Gem::Specification.new do |spec|
  spec.name          = "solar-system-weather"
  spec.version       = "0.1"
  spec.authors       = ["theo"]
  spec.email         = ["teddyhoover@gmail.com"]

  spec.summary       = "Gives space facts based on the weather."
  spec.description   = "Uses open weather's api to find local weather, compares the temperature to planet average temperatures and gives planet facts."
  spec.homepage      = "https://github.com/theohlc/solar-system-weather"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/theohlc/solar-system-weather"
  spec.metadata["changelog_uri"] = "https://github.com/theohlc/solar-system-weather"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
end
