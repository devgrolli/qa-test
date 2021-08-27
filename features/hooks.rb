require 'report_builder'
require 'base64'

$trivia_page = PageTrivia::Pages
$screenshot_counter = 1

def timestamp
  date = Time.now.strftime('%Y%m%d').to_s
  time = Time.now.strftime('%H-%M-%S').to_s
  "#{date}_#{time}"
end

RUN_TSTAMP = timestamp.freeze
RUN_DIR = "reports/screenshots/#{RUN_TSTAMP}/".freeze

def normalize_file_name(file_name = '')
  file_name
    .to_s
    .gsub(/[^0-9A-Za-z_\-]/, '_')
    .gsub(/_{2,}/, '_')
    .gsub(/_$/, '')
    .downcase
end

def take_screenshot(file_name = '', status = :passed)
  file_extension = '.png'
  file_name_normalized = normalize_file_name(file_name)
  status_normalized = normalize_file_name(status)
  file_name_prefix = $screenshot_counter.to_s + status_normalized + (file_name_normalized.empty? ? '' : '_')
  file_path = "#{RUN_DIR}#{file_name_prefix}#{file_name_normalized}#{file_extension}"
  Capybara.page.save_screenshot(file_path)
  embed("data:image/png;base64,#{page.driver.browser.screenshot_as(:base64)}", 'image/png')

  $screenshot_counter += 1
end

def class_name(object)
  object.class.name.split('::').last
end

def status_from_result(result)
  class_name result
end

After do |_scenario|
  take_screenshot('failed', 'failed') if _scenario.failed?
  Capybara.reset_session!
  Capybara.current_session.driver.quit
  clear_reports
end

AfterStep do |result, step|
  status_name = status_from_result result
  take_screenshot(step.text, status_name)
rescue StandardError => exception
  puts exception
end

at_exit do
  time = Time.now.getutc
  time.localtime
  date = DateTime.now.to_date
  date = date.to_s
  @now = Date.strptime(date, '%Y-%m-%d')

  ReportBuilder.configure do |config|
    nome = 'Desafio CI&T'
    config.encoding = 'utf-8'
    Encoding.default_external = 'UTF-8'
    Encoding.default_internal = 'UTF-8'
    Encoding::UTF_8
    config.input_path = 'reports/'
    config.report_path = 'reports/builder_report'
    config.report_types = [:html]
    config.report_title = nome
    config.color = 'red'
    config.include_images = true
    config.additional_css = 'features\support\css_report_builder.css'
    config.additional_info = {
      'URL' => URL,
      'Data' => @now.strftime('%d/%m/%Y'),
      'Projeto' => nome
    }
  end
  ReportBuilder.build_report
end

def clear_reports
  files = Dir.glob('reports/*')
  time = RUN_TSTAMP[0..-4]
  files.each { |file| FileUtils.remove_file(file, force = true) unless file.match(/#{time}/) || file.match(/screenshots/) }
  clear_screenshots
end

def clear_screenshots
  files = Dir.glob('reports/screenshots/*')
  time = RUN_TSTAMP[0..-4]
  files.each { |file| FileUtils.remove_dir(file, force = true) unless file.match(/#{time}/) }
end
