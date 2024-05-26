require "grip"
require "http"
require "csv"

require "../services/clockify_worklog_service"
require "../readers/clockify_file_reader"

class FileWorklogController < Grip::Controllers::Http
  # post "/register/file" do |env|
  #   controller = self.new
  #   file = controller.extract_file_from_request(env.request)
  #   
  #   response = { "message" => "sucess" }.to_json
  #   env.response.content_type = "application/json"

  #   response
  # end

  def execute(context : Context) : Context
    
  end

  def extract_file_from_request(request : HTTP::Request)
    content_type = request.headers["Content-Type"]
    raise "Content-Type header not found or invalid!" if !content_type || allowed_headers.index(content_type)

    return parse_multipart_file(request) if content_type == "multipart/form-data"

    puts "XAMA"
  end

  private def allowed_headers : Array(String)
    ["multipart/form-data", "text/csv"]
  end

  private def parse_multipart_file(request : HTTP::Request) : Nil
  end

  private def parse_binary_file(request : HTTP::Request) : Nil
  end
end
