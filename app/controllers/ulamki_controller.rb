class UlamkiController < ApplicationController
  protect_from_forgery with: :exception
  
  
  def wynik_stringi
    
  end
  
  def rzymskie
    @ulamek1 = rand(1..100)
    session[:rodzaj] = "rzymskie"
    
  end
    
    
    
    
  def ilerazy
    @ulamek1 = rand(11...30)
    @ulamek2 = rand(2...10)
    @ulamek3 = @ulamek1 * @ulamek2
    @ulamek4 = @ulamek1 - @ulamek2
    session[:rodzaj] = "ilerazy"
    
  end
  
  
  
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
  
  
  def zaokraglanie_naturalnych
    n = rand(-3..-1)
    @ulamek1 = rand(10000..99999)
    @wynik = @ulamek1.round(n)
    session[:rodzaj] = "zaokraglanie_naturalnych"
    
    if n == -3
      @miejsce = "tysięcy"
      elsif n == -2
      @miejsce = "setek"
    else
      @miejsce = "dziesiątek"
    end
  end
  
  def zaokraglanie_ulamkow
    n = rand(0..4)
    @ulamek1 = rand(1.0..99.99999).round(5)
    @wynik = @ulamek1.round(n)
    session[:rodzaj] = "zaokraglanie_ulamkow"
    
    if n == 0
      @miejsce = "jednostek"
      elsif n == 1
      @miejsce = "części dziesiętnych"
      elsif n == 2
      @miejsce = "części setnych"
      elsif n == 3
      @miejsce = "części tysięcznych"
      else
      @miejsce = "części dziesięciotysięcznych"
    end
  end
  
end
