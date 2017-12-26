module UlamkiHelper
  
  def sprawdz
    if params[:w].to_f == session[:wynik]
    render html: "Świetnie! Zdobywasz punkt!"
     else
    render html: "Zonk! Twoim zdaniem jest to #{params[:w]}, a powinno być #{session[:wynik]}"
    end
  end

def pomnoz
  @wynik = @ulamek1 * @ulamek2
  session[:wynik] = @wynik.round(6)
  render html: "Ile to będzie #{@ulamek1} x #{@ulamek2}?"
end

def odejmij
  if @ulamek1 >= @ulamek2
    @wynik = @ulamek1 - @ulamek2
    session[:wynik] = @wynik.round(6)
    render html: "Ile to będzie #{@ulamek1} - #{@ulamek2}?"

    else
    @wynik = @ulamek2 - @ulamek1
    session[:wynik] = @wynik.round(6)
    render html: "Ile to będzie #{@ulamek2} - #{@ulamek1}?"
   
  end

end

def dodaj
  @wynik = @ulamek1 + @ulamek2
  session[:wynik] = @wynik.round(6)
  render html: "Ile to będzie #{@ulamek1} + #{@ulamek2}?"
 

end

def podziel
  ulamek3 = @ulamek1 * @ulamek2
  @wynik = @ulamek2
  session[:wynik] = @wynik.round(6)
  render html: "Ile to będzie #{ulamek3} : #{@ulamek1}?"


end
  
  def generuj_dzialanie

  y = rand(1..4)
    if y == 1
      pomnoz
    elsif y == 2
      podziel
    elsif y == 3
      dodaj
    else
      odejmij
    end

  end
  
end
