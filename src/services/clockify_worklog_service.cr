require "../strategies/strategy"

class ClockifyWorklogService
  def log_time(strategy : Strategy) : Bool
    p strategy.rows
    true
  end
end
