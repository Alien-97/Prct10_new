lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "huella_nutricional/version"

Gem::Specification.new do |spec|
  spec.name          = "huella_nutricional"
  spec.version       = HuellaNutricional::VERSION
  spec.authors       = ["Alien-97"]
  spec.email         = ["alu0101035406@ull.edu.es"]

  spec.summary       = %q{Gema que va a contener el desarrollo de código para calcular la huella nutricional/ambiental de alimentos}
  spec.description   = %q{Gema que va a contener el desarrollo de código para calcular la huella nutricional/ambiental de alimentos}
  spec.homepage      = "https://github.com/ULL-ESIT-LPP-1920/tdd-Alien-97"

  spec.metadata["allowed_push_host"] = "https://github.com/ULL-ESIT-LPP-1920/tdd-Alien-97"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/ULL-ESIT-LPP-1920/tdd-Alien-97"
  spec.metadata["changelog_uri"] = "https://github.com/ULL-ESIT-LPP-1920/tdd-Alien-97"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
