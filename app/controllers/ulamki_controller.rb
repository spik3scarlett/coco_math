class UlamkiController < ApplicationController
  protect_from_forgery with: :exception
  def tabliczka
    @ulamek1 = rand(1..9)
    @ulamek2 = rand(1..9)
    session[:rodzaj] = "tabliczka"
  end

  
  def dzialanie
    n = rand(1..2)
    m = rand(1..3)
    @ulamek1 = rand(0.1..9.9).round(n)
    @ulamek2 = rand(0.1..99.9).round(m)
    session[:rodzaj] = "ulamki"

  end

  def wynik
   render 'wynik'
  end
end
