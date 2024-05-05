require "csv"
require "./file_reader"

class ClockifyFileReader < FileReader
  @file : CSV

  def initialize(file_io : IO)
    @file = parse_csv(file_io)
  end

  private def parse_csv(file_io : IO)
    file = CSV.new(file_io, headers: true)
    file.next

    @file = file
  end
end
