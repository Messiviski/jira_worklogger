require "kemal"
require "csv"

require "./controllers/file_worklog_controller"

module JiraWorklogger
  VERSION = "0.1.0"

  before_post "/registe/file" do |env|
  end

  post "/register/file" do |env|
    controller = FileWorklogController.new
    controller.execute(env.request, env.response)
  end

  Kemal.run
end
