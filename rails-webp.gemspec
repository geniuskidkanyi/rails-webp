
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "rails/webp/version"

Gem::Specification.new do |spec|
  spec.name          = "rails-webp"
  spec.version       = Rails::WebP::VERSION
  spec.authors       = ["Jake Peterson"]
  spec.email         = ["hello@jakenberg.io"]

  spec.summary       = %q{Use minimagick during asset precompilation to make a copy of jpg/png as webp}
  spec.description   = %q{I have a dream, that one day, Rails won't make us write descriptions before our gems compile.}
  spec.homepage      = "https://github.com/jakenberg"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "https://rubygems.org"

    spec.metadata["homepage_uri"] = spec.homepage
    spec.metadata["source_code_uri"] = "https://github.com/jakenberg/rails-webp"
    spec.metadata["changelog_uri"] = "https://github.com/jakenberg/rails-webp/CHANGELOG.md"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.3"
  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "rspec", "~> 3.0"

  spec.add_dependency "rails"
  spec.add_dependency "ruby-vips"
end
