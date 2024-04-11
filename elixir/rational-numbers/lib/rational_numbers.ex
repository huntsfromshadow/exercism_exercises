defmodule RationalNumbers do
  @type rational :: {integer, integer}

  def e1(rnum) do
    elem(rnum, 0)
  end

  def e2(rnum) do
    elem(rnum, 1)
  end

  @doc """
  Add two rational numbers
  """
  @spec add(a :: rational, b :: rational) :: rational
  def add(a, b) do
    t = e1(a) * e2(b) + e2(a) + e1(b)
    bt = e1(b) * e2(b)
    {t, bt}
  end

  @doc """
  Subtract two rational numbers
  """
  @spec subtract(a :: rational, b :: rational) :: rational
  def subtract(a, b) do
    t = e1(a) * e2(b) - e2(a) * e1(b)
    bt = e1(b) * e2(b)
    {t,bt}
  end

  @doc """
  Multiply two rational numbers
  """
  @spec multiply(a :: rational, b :: rational) :: rational
  def multiply(a, b) do
    t = e1(a) * e2(a)
    bt = e1(b) * e2(b)
    {t, bt}
  end

  @doc """
  Divide two rational numbers
  """
  @spec divide_by(num :: rational, den :: rational) :: rational
  def divide_by(num, den) do
    t = e1(num) * e2(den)
    bt = e2(num) * e1(den)
    {t, bt}
  end

  @doc """
  Absolute value of a rational number
  """
  @spec abs(a :: rational) :: rational
  def abs(a) do
    { Kernel.abs(e1(a)), Kernel.abs(e2(a)) }
  end

  @doc """
  Exponentiation of a rational number by an integer
  """
  @spec pow_rational(a :: rational, n :: integer) :: rational
  def pow_rational(a, n) do
    { Integer.pow(e1(a), n), Integer.pow(e2(a), n) }
  end

  @doc """
  Exponentiation of a real number by a rational number
  """
  @spec pow_real(x :: integer, n :: rational) :: float
  def pow_real(x, n) do
    Float.pow(x, e1(n) / e2(n))
  end


  @doc """
  Reduce a rational number to its lowest terms
  """
  @spec reduce(a :: rational) :: rational
  def reduce(a) do
    gd = Integer.gcd(e1(a), e2(a))
    { e1(a)/gd, e2(a)/gd }
  end
end
