class UlamkiController < ApplicationController
  protect_from_forgery with: :exception
  
  def tabliczka
    @ulamek1 = rand(2..9)
    @ulamek2 = rand(2..9)
    session[:rodzaj] = "tabliczka"
  end

  def jednostki
    @ulamek1 = rand(10...100)/10.to_f
    session[:rodzaj] = "jednostki"
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
