require "kemal"
require "csv"

require "./controllers/worklog_controller"

module JiraWorklogger
  VERSION = "0.1.0"

  post "/register" do |env|
    test = env.params.json["test"].as(String)
    test
  end

  post "/register/file" do |env|
    controller = WorklogController.new
    controller.execute(env.request, env.response)
  end

  Kemal.run
end
