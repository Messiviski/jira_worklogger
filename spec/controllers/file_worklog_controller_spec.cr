require "../spec_helper"

describe FileWorklogController do
  app = Application.new("test")
  io = IO::Memory.new
  multipart = MIME::Multipart::Builder.new(io)
  boundary = multipart.boundary
  scope = "/api/v1"

  request_path = "#{scope}/register/file"
  request_headers = HTTP::Headers { "Content-Type" => "multipart/form-data; boundary=#{boundary}" }
  multipart_headers = HTTP::Headers {
    "Content-Disposition" => "form-data; name=file; filename=\"clockify_report.csv\"",
    "Content-Type" => "text/csv"
  }

  context "when a request is sent with a file to log the work hours" do
    it "returns 200" do
      file = File.read("./spec/fixtures/clockify_report.csv")
      multipart.body_part(multipart_headers, file)
      multipart.finish

      response = post app, request_path, request_headers, io.to_s
      response.status_code.should eq 200
    end
  end
end
