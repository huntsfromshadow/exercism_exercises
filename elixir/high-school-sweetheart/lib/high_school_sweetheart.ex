defmodule HighSchoolSweetheart do
  def first_letter(name) do
    String.at(String.trim(name), 0)
  end

  def initial(name) do
    first_letter(String.upcase(name)) <> "."
  end

  def initials(full_name) do
    a = String.split(full_name)
    fnm = String.trim(List.first(a))
    ln = String.trim(List.last(a))
    initial(fnm) <> " " <> initial(ln)
  end

  def pair(full_name1, full_name2) do
    a = initials(full_name1)
    b = initials(full_name2)
    "     ******       ******\n" <>
    "   **      **   **      **\n" <>
    " **         ** **         **\n" <>
    "**            *            **\n" <>
    "**                         **\n" <>
    "**     #{a}  +  #{b}     **\n" <>
    " **                       **\n" <>
    "   **                   **\n" <>
    "     **               **\n" <>
    "       **           **\n" <>
    "         **       **\n" <>
    "           **   **\n" <>
    "             ***\n" <>
    "              *\n"
  end
end
