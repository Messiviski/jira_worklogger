require "../readers/file_reader"

class ClockifyWorklogService
  def log_time(reader : FileReader) : Bool
    puts reader
    true
  end
end
