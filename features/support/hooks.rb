After do |scenario|
  if scenario.failed?
    unless File.directory?("report/screenshots/")
        FileUtils.mkdir_p("report/screenshots/")
    end
    file_name = scenario.name.downcase
    screenshot_name = "report/screenshots/#{file_name}.png"
    page.save_screenshot(screenshot_name)
    embed(screenshot_name, 'image/png', 'Evidencia')
  end
end