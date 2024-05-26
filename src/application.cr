require "grip"

require "./controllers/file_worklog_controller"

class Application < Grip::Application
  def initialize(environment : String)
    super(environment)

    scope "/api" do
      scope "/v1" do
        post "/register/file", FileWorklogController, as: :execute 
      end
    end
  end

  def port : Int32
    3000
  end
end
