defmodule SpaceAge do
  @type planet ::
          :mercury
          | :venus
          | :earth
          | :mars
          | :jupiter
          | :saturn
          | :uranus
          | :neptune

  @doc """
  Return the number of years a person that has lived for 'seconds' seconds is
  aged on 'planet', or an error if 'planet' is not a planet.
  """
  @spec age_on(planet, pos_integer) :: {:ok, float} | {:error, String.t()}
  def age_on(planet, seconds) do
    {:ok, seconds / planet_secs(planet) }
  end

  def planet_secs(planet) do
    case planet do
      :mercury  -> 0.2408467  * 31557600.0
      :venus    -> 0.61519726 * 31557600.0
      :earth    ->          1 * 31557600.0
      :mars     -> 1.8808158  * 31557600.0
      :jupiter  -> 11.862615  * 31557600.0
      :saturn   -> 29.447498  * 31557600.0
      :uranus   -> 84.016846  * 31557600.0
      :neptune  -> 164.79132  * 31557600.0
    end
  end
end
