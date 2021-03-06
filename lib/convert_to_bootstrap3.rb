require 'convert_to_bootstrap3/version'
require 'capybara'
require 'capybara/poltergeist'

Capybara.default_driver = :poltergeist
Capybara.run_server = false

Capybara.register_driver :poltergeist do |app|
  Capybara::Poltergeist::Driver.new(app, phantomjs_options: %w(--load-images=false --disk-cache=false))
end

module ConvertToBootstrap3
  class Converter
    include Capybara::DSL

    attr_accessor :converter_url

    def initialize
      @converter_url = 'http://code.divshot.com/bootstrap3_upgrader/'
    end

    def convert_in_place(directory = "")
      directory << '**/*.html*'

      visit @converter_url

      all_files = Dir.glob(directory).reject { |file| File.directory? file }

      all_files.each { |file| convert_file_contents(file) }
    end

  private

    def convert_file_contents(file)
      file_contents = File.read(file)

      fill_in 'source', with: file_contents
      click_button 'Convert This Code'

      all(:xpath, "//textarea[@id='result']").each do |a|
        result = fix_embedded_language_tags a.value
        File.open(file, 'w+') { |f| f.write(result) }
      end
    end

    def fix_embedded_language_tags(string)
      fix_php_tags fix_ruby_tags string
    end

    def fix_ruby_tags(string)
      string.gsub(/&lt;%=/, '<%=').gsub(/&lt;%#/, '<%#').gsub(/&lt;%-/, '<%-')
            .gsub(/&lt;%/, '<%').gsub(/=&gt;/, '=>').gsub(/%&gt;/, '%>')
    end

    def fix_php_tags(string)
      string.gsub(/(<!--)\?(php)/, '<?php').gsub(/(<!--)\?/, '<?').gsub(/\?(-->)/, '?>')
    end

  end
end
