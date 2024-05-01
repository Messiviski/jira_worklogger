require "http"
require "csv"

require "../services/clockify_worklog_service"
require "../strategies/clockify_strategy"

class FileWorklogController
  alias Request = HTTP::Request
  alias Response = HTTP::Server::Response

  def execute(request : Request, response : Response) : Response
    strategy = ClockifyStrategy.new(parse_form_data(request), separator: ',')

    service = ClockifyWorklogService.new
    service.log_time(strategy)

    response.respond_with_status(HTTP::Status::OK, "OK")
    response
  end

  private def parse_form_data(request : Request) : IO
    file = nil

    HTTP::FormData.parse(request) { |upload| file = upload.body }
    raise "No file received!" if file.nil?

    file
  end
end
