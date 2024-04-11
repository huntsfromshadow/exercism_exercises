defmodule ComplexNumbers do
  @typedoc """
  In this module, complex numbers are represented as a tuple-pair containing the real and
  imaginary parts.
  For example, the real number `1` is `{1, 0}`, the imaginary number `i` is `{0, 1}` and
  the complex number `4+3i` is `{4, 3}'.
  """
  @type complex :: {float, float}

  @doc """
  Return the real part of a complex number
  """
  @spec real(a :: complex) :: float
  def real(a) do
    elem(a, 0)
  end

  @doc """
  Return the imaginary part of a complex number
  """
  @spec imaginary(a :: complex) :: float
  def imaginary(a) when is_tuple(a) do
    elem(a, 1)
  end

  @doc """
  Multiply two complex numbers, or a real and a complex number
  """
  @spec mul(a :: complex | float, b :: complex | float) :: complex
  def mul(a, b) do
    cond do
      is_tuple(a) && is_tuple(b) -> mul_comp(a, b)
      is_number(a) -> mul_w_real(a, b)
      is_number(b) -> mul_w_real(b, a)
    end

    # (a + i * b) * (c + i * d) = (a * c - b * d) + (b * c + a * d) * i
    # A complex number is a number in the form a + b * i where a and b are real and i satisfies i^2 = -1.
    # z1 = {1, 2}
    # z2 = {3, 4}
    # expected = {-5, 10}
  end

  def mul_comp(a, b) do
    {n_a, n_b} = a
    {n_c, n_d} = b

    v1 = n_a * n_c - n_b * n_d
    v2 = n_b * n_c + n_a * n_d

    {v1, v2}
  end

  def mul_w_real(flv, compv) do
    {flv * elem(compv, 0), flv * elem(compv, 1)}
  end

  @doc """
  Add two complex numbers, or a real and a complex number
  """
  @spec add(a :: complex | float, b :: complex | float) :: complex
  def add(a, b) do
    cond do
      is_tuple(a) && is_tuple(b) -> add_complex(a, b)
      is_number(a) -> add_comp_w_real(a, b)
      is_number(b) -> add_comp_w_real(b, a)
    end
  end

  def add_comp_w_real(fv, cv) do
    {n_a, n_b} = cv
    {n_a + fv, n_b}
  end

  def add_complex(a, b) do
    {n_a, n_b} = a
    {n_c, n_d} = b
    {n_a + n_c, n_b + n_d}
  end

  @doc """
  Subtract two complex numbers, or a real and a complex number
  """
  @spec sub(a :: complex | float, b :: complex | float) :: complex
  def sub(a, b) do
    cond do
      is_tuple(a) && is_tuple(b) -> sub_complex(a, b)
      is_number(a) -> sub_complex({a, 0}, b)
      is_number(b) -> sub_complex(a, {b, 0})
    end
  end

  def sub_complex(a, b) do
    {n_a, n_b} = a
    {n_c, n_d} = b

    {n_a - n_c, n_b - n_d}
  end

  @doc """
  Divide two complex numbers, or a real and a complex number
  """
  @spec div(a :: complex | float, b :: complex | float) :: complex
  def div(a, b) do
    cond do
      is_tuple(a) && is_tuple(b) -> div_complex(a, b)
      is_number(a) -> div_complex({a, 0}, b)
      is_number(b) -> div_complex(a, {b, 0})
    end
  end

  def div_complex(a, b) do
    {n_a, n_b} = a
    {n_c, n_d} = b

    {
      (n_a * n_c + n_b * n_d) / (n_c * n_c + n_d * n_d),
      (n_b * n_c - n_a * n_d) / (n_c * n_c + n_d * n_d)
    }
  end

  @doc """
  Absolute value of a complex number
  """
  @spec abs(a :: complex) :: float
  def abs(a) do
    {n_a, n_b} = a

    :math.sqrt(n_a * n_a + n_b * n_b)
  end

  @doc """
  Conjugate of a complex number
  """
  @spec conjugate(a :: complex) :: complex
  def conjugate(a) do
    {n_a, n_b} = a
    {n_a, -1 * n_b}
  end

  @doc """
  Exponential of a complex number
  """
  @spec exp(a :: complex) :: complex
  def exp(a) do
    {n_a, n_b} = a
    ta = :math.exp(n_a)

    {
      ta * :math.cos(n_b),
      ta * :math.sin(n_b)
    }
  end
end
