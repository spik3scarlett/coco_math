module UlamkiHelper
  def wstaw_guzik
    if session[:rodzaj] == "ulamki"
      render html:  '<a href="/dzialanie" classtype="button" class="btn btn-info" value="Input Button">Gram dalej</a>'.html_safe
    else
      render html:  '<a href="/tabliczka" classtype="button" class="btn btn-info" value="Input Button">Gram dalej</a>'.html_safe
    end
  end
  
  def sprawdz
     if params[:w].include?(",")
    input = params[:w].sub!(",", ".").to_f
     else
    input = params[:w].to_f   
     end
    if input == session[:wynik]
      if session[:punkty].nil?
        session[:punkty] = 1
      else
        session[:punkty] += 1
      end  
    render html: "Świetnie! Zdobywasz punkt! Liczba Twoich punktów: #{session[:punkty]}"
    
     else
    render html: "Zonk! Twoim zdaniem jest to #{params[:w]}, a powinno być #{session[:wynik]}"
    end
  end

def pomnoz
  @wynik = @ulamek1 * @ulamek2
  session[:wynik] = @wynik.round(5)
  render html: "Ile to będzie #{@ulamek1} x #{@ulamek2}?"
end

def odejmij
  if @ulamek1 >= @ulamek2
    @wynik = @ulamek1 - @ulamek2
    session[:wynik] = @wynik.round(5)
    render html: "Ile to będzie #{@ulamek1} - #{@ulamek2}?"

    else
    @wynik = @ulamek2 - @ulamek1
    session[:wynik] = @wynik.round(5)
    render html: "Ile to będzie #{@ulamek2} - #{@ulamek1}?"
   
  end

end

def dodaj
  @wynik = @ulamek1 + @ulamek2
  session[:wynik] = @wynik.round(5)
  render html: "Ile to będzie #{@ulamek1} + #{@ulamek2}?"
 

end

def podziel
  ulamek3 = @ulamek1.round(1) * @ulamek2.round(2)
  @wynik = @ulamek2.round(2)
  session[:wynik] = @wynik.round(3)
  render html: "Ile to będzie #{ulamek3.round(3)} : #{@ulamek1.round(1)}?"


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
