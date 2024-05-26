require "grip"

require "./controllers/*"

class Application < Grip::Application
  def initialize(environment : String)
    super(environment)

    scope "/api" do
      scope "/v1" do
        exception Grip::Exceptions::NotFound, NotFoundController
        exception Grip::Exceptions::InternalServerError, InternalServerErrorController

        post "/register/file", FileWorklogController, as: :execute 
      end
    end

    router.insert(0, Grip::Handlers::Log.new)
  end

  def port : Int32
    3000
  end
end
