require "grip"

class NotFoundController < Grip::Controllers::Exception
  def call(context : Context) : Context
    context.json({ "errors" => [context.exception.not_nil!.to_s] })
  end
end
