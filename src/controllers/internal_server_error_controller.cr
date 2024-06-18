require "grip"

class InternalServerErrorController < Grip::Controllers::Exception
  def call(context : Context) : Context
    puts context.exception.not_nil!.to_s
    context.json({ "errors" => [context.exception.not_nil!.to_s] })
  end
end
