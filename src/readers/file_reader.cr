require "csv"

abstract class FileReader
  abstract def parse_csv(file_io : IO)
end
