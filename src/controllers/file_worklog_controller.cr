require "athena"
require "http"
require "csv"

require "../services/clockify_worklog_service"
require "../readers/clockify_file_reader"

class FileWorklogController < ATH::Controller

  @[ARTA::Post("/register/file")]
  def execute(request : ATH::Request) : ATH::Response
    body = request.body
    raise "No file was received!" unless body

    strategy = ClockifyFileReader.new(body)
    service = ClockifyWorklogService.new
    service.log_time(strategy)

    ATH::Response.new(contenc: "sucess!", status: HTTP::Status::OK)
  end
end
