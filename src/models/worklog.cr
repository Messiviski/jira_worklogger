class Worklog
  property task : String | Nil
  property description : String | Nil
  property start_date : Time | Nil
  property end_date : Time | Nil

  def to_a : Array(String) 
    [task, description, start_date.to_s(time_pattern), end_date.to_s(time_pattern)]
  end

  private def time_pattern : String
    "%Y-%m-%d"
  end
end
