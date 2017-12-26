class UlamkiController < ApplicationController
  protect_from_forgery with: :exception
  

  
  def dzialanie
    n = rand(1..3)
    @ulamek1 = rand(0.1..99.9).round(n)
    @ulamek2 = rand(0.1..99.9).round(n)
  end

  def wynik
   render 'wynik'
  end
end
