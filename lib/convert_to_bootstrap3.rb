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

    def convert_in_place
      url = 'http://code.divshot.com/bootstrap3_upgrader/'
      source = '<div class="span6">&#10;<a class="btn">Button</a>&#10;</div>'
      visit url
      doc = Nokogiri::HTML(page.html)

      fill_in 'source', with: source
      all(:xpath, "//textarea[@id='source']").each { |a| puts a.value }

      click_button 'Convert This Code'
      result = doc.css('#result').text.strip
      puts result

      all(:xpath, "//textarea[@id='result']").each { |a| puts a.value }

      File.open('test_file', 'w+') { |f| f.write('testing') }
    end

  end
end
