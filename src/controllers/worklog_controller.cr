require "http"
require "../services/clockify_worklog_service"

class WorklogController
  alias Request = HTTP::Request
  alias Response = HTTP::Server::Response

  def execute(request : Request, response : Response) : Response
    parse_file(request)

    # service = ClockifyWorklogService.new
    # service.log_time(@filename)

    response.respond_with_status(HTTP::Status::OK, "OK")
    response
  end

  private def parse_file(request : Request)
    HTTP::FormData.parse(request) do |upload|
      filename = upload.filename
      next unless filename.is_a? String

      file_path = File.join(Kemal.config.public_folder, "uploads/", filename)
      File.open(file_path, "w") { |f| IO.copy(upload.body, f) }
    end
  end
end
