require "csv"

abstract class Strategy
  def read
    raise "Method not implemented!"
  end

  def parse_csv(file_io : IO, separator : Char) : CSV
    file = CSV.new(file_io, headers: true, separator: separator)
    file.next

    file
  end
end
