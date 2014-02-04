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

    def convert_in_place!
      visit @converter_url
      doc = Nokogiri::HTML(page.html)

      all_files = Dir.glob('**/*.html*').reject { |file| File.directory? file }

      all_files.each do |file|
        file_contents = File.read(file)

        fill_in 'source', with: file_contents
        all(:xpath, "//textarea[@id='source']").each { |a| puts a.value }

        click_button 'Convert This Code'

        all(:xpath, "//textarea[@id='result']").each do |a|
          File.open(file, 'w+') { |f| f.write(a.value) }
        end
      end
    end

  end
end
