defmodule FreelancerRates do
  def daily_rate(hourly_rate) do
    8.0 * hourly_rate
  end

  def apply_discount(before_discount, discount) do
    before_discount - (before_discount * (discount / 100))
  end

  def monthly_rate(hourly_rate, discount) do
    a = daily_rate(hourly_rate) * 22
    apply_discount(a, discount)
    |> ceil()
  end

  def days_in_budget(budget, hourly_rate, discount) do
    dr = daily_rate(hourly_rate)
    dd = apply_discount(dr, discount)
    budget / dd
    |> Float.floor(1)
  end
end
