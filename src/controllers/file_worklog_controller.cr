require "grip"
require "csv"

require "../services/clockify_worklog_service"
require "../readers/clockify_file_reader"

class FileWorklogController < Grip::Controllers::Http
  def execute(context : Context) : Context
    reader = ClockifyFileReader.new(context.fetch_file_params["file"].tempfile)
    # service = ClockifyWorklogService.new

    # service.log_time(reader)
    context.json({ "message" => "success" })
  end

  def test(context : Context) : Context
    context.json({ "message" => "success" })
  end
end
