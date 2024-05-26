require "csv"
require "./file_reader"

class ClockifyFileReader < FileReader
  @file : CSV

  def initialize(file : IO)
    @file = parse_csv(file)
    extract_data_from_file
  end

  private def parse_csv(raw_file : IO)
    file = CSV.new(raw_file, headers: true)
    file.next

    @file = file
  end

  private def extract_data_from_file
    puts @file.headers
  end
end
