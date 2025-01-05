source "https://rubygems.org"
#ruby RUBY_VERSION
ruby File.read(File.expand_path('../.ruby-version', __FILE__)).chomp

# Hello! This is where you manage which Jekyll version is used to run.
# When you want to use a different version, change it below, save the
# file and run `bundle install`. Run Jekyll with `bundle exec`, like so:
#
#     bundle exec jekyll serve
#
# This will help ensure the proper Jekyll version is running.
# Happy Jekylling!
gem "jekyll" #, "~> 3.8.0"
gem 'webrick'

# temp fix for ruby 3.3 while waiting for new release (dec '23')
gem 'google-protobuf', "~> 3.21.12"

# This is the default theme for new Jekyll sites. You may change this to anything you like.
gem "minima" #, "~> 2.0"

# language deps
gem 'csv'
gem 'base64'
gem 'bigdecimal'

# gem install eventmachine -- --with-cppflags=-I/usr/local/opt/openssl/include 
# macos: 
# gem install eventmachine -- --with-cppflags=-I/opt/homebrew/Cellar/openssl@1.1/1.1.1s/include
# gem install eventmachine -- --with-cppflags=-I/opt/homebrew/Cellar/openssl@3/3.0.7/include/
#gem 'eventmachine'

# If you want to use GitHub Pages, remove the "gem "jekyll"" above and
# uncomment the line below. To upgrade, run `bundle update github-pages`.
# gem "github-pages", group: :jekyll_plugins

# If you have any plugins, put them here!
group :jekyll_plugins do
   gem "jekyll-feed" # , "~> 0.6"
end



# bundle lock --add-platform x86_64-linux
# bundle lock --add-platform arm64-darwin-20
