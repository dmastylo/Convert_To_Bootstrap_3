# ConvertToBootstrap3

This gem converts all .html files in a folder from Bootstrap 2 into Bootstrap 3 markup. This includes
language specific files like .html.erb, or others.

Requires PhantomJS headless browser.

## Installation

Add this line to your application's Gemfile:

```
gem 'convert_to_bootstrap3'
```

And then execute:

```
$ bundle
```

Or install it yourself as:

```
$ gem install convert_to_bootstrap3
```

## Usage

Go to the root folder of your project, and run the command "convert_to_bootstrap_3" from a terminal or shell.
This will go through all your files (including ones in subdirectories) and convert the markup from
Bootstrap 2 to Bootstrap 3 markup. Spacing/tabbing and identation may, or may not, be
altered in the process, and you should NOT consider this production ready code. Reviewing the
results and making sure everything is correct manually is recommended, but this tool will
considerably lessen your time spent converting the markup in your projects.

If you want to use ConvertToBootstrap3 in your code do

```
converter = ConvertToBootstrap3::Converter.new
converter.convert_in_place("directory/")
```

the directory parameter is optional, but needs to have the forward slash at the end.

## Contributing

1. Fork it ( http://github.com/dmastylo/convert_to_bootstrap3/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
