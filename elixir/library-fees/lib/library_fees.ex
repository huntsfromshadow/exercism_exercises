defmodule LibraryFees do
  def datetime_from_string(string) do
    elem(NaiveDateTime.from_iso8601(string), 1)
  end

  def before_noon?(datetime) do
    noon = NaiveDateTime.new!(
      datetime.year, datetime.month, datetime.day, 12, 00, 00, 00)
    NaiveDateTime.before?(datetime, noon)
  end

  def return_date(checkout_datetime) do
    if before_noon?(checkout_datetime) do
      NaiveDateTime.add(checkout_datetime, 28, :day)
      |> NaiveDateTime.to_date()
    else
      NaiveDateTime.add(checkout_datetime, 29, :day)
        |> NaiveDateTime.to_date()
    end
  end

  @spec days_late(any(), %{
          :calendar => any(),
          :day => any(),
          :hour => any(),
          :microsecond => any(),
          :minute => any(),
          :month => any(),
          :second => any(),
          :year => any(),
          optional(any()) => any()
        }) :: 0
  def days_late(planned_return_date, actual_return_datetime) do
    cond do
      Date.compare(planned_return_date,actual_return_datetime) == :eq -> 0
      Date.compare(planned_return_date, actual_return_datetime) == :gt -> 0
      true ->
        Date.diff(actual_return_datetime, planned_return_date)
    end
  end

  def monday?(datetime) do
    Date.day_of_week(datetime) == 1
  end

  def calculate_late_fee(checkout, return, rate) do
    chk_dt = datetime_from_string(checkout)
    pln_dt = return_date(chk_dt)
    act_ret_dt = datetime_from_string(return)

    dl = days_late(pln_dt, act_ret_dt)
    cond do
      dl == 0 -> 0
      dl != 0 && monday?(act_ret_dt) -> Float.floor((dl * rate) / 2)
      true -> dl * rate
    end

  end
end
