require "csv"
require "./strategy"

class ClockifyStrategy < Strategy
  def initialize(file_io : IO, separator : Char)
    @file = self.parse_csv(file_io, separator)
  end

  def read
    p @file
  end

  def rows
    @file.row.to_a
  end
end
