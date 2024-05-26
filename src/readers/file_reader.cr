require "csv"

abstract class FileReader
  abstract def parse_csv(raw_file : IO)
end
