class WeeklySales < Feature
  def total
    db[:train].
      where(store:store, dept:dept, date:date).
      select(:weekly_sales).
      first[:weekly_sales].to_f
  end
end