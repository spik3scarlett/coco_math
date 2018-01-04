module UlamkiHelper
  def usun_zera(wynik)
  tablica = wynik.to_s.chars
    if tablica.include?(".")
    
      while tablica[-1] == "0" do
        tablica.pop
      end
      tablica.join
      
    else
      wynik
    end
  end
  
    def przeliczaj_jednostki
      przedrostki_m = [[ "mikro", "µ", 0.000001], ["mili", "m", 0.001], ["centy", "c", 0.01], ["decy", "d", 0.1], ["kilo", "k", 1000], ["", "", 1]]
      przedrostki_l = [[ "mikro", "µ", 0.000001], ["mili", "m", 0.001], ["decy", "d", 0.1], ["hekto", "h", 100], ["", "", 1]]
      przedrostki_g = [[ "mikro", "µ", 0.000001], ["mili", "m", 0.001], ["deka", "da", 10], ["kilo", "k", 1000], ["", "", 1]]
      jednostki = [["litrów", "l", przedrostki_l], ["gramów", "g", przedrostki_g], ["metrów", "m", przedrostki_m]]
      
      @jednostka = jednostki.sample
      @przedrostek1 = @jednostka[2].sample
      @jednostka[2].delete(@przedrostek1)
      @przedrostek2 = @jednostka[2].sample
      
      @wynik = @ulamek1  * @przedrostek1[2] / @przedrostek2[2] 
      session[:wynik] = "%1.10f" % @wynik
      render html: "Uzupełnij: #{@ulamek1} #{@przedrostek1[1]}#{@jednostka[1]} (#{@przedrostek1[0]}#{@jednostka[0]}) - ile to będzie #{@przedrostek2[1]}#{@jednostka[1]} (#{@przedrostek2[0]}#{@jednostka[0]})?"
    end
  
  def wstaw_guzik
    if session[:rodzaj] == "ulamki"
      render html:  '<a href="/dzialanie" classtype="button" class="btn btn-info" value="Input Button">Gram dalej</a>'.html_safe
    elsif session[:rodzaj] == "tabliczka"
      render html:  '<a href="/tabliczka" classtype="button" class="btn btn-info" value="Input Button">Gram dalej</a>'.html_safe
    else
      render html:  '<a href="/jednostki" classtype="button" class="btn btn-info" value="Input Button">Gram dalej</a>'.html_safe
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
    render html: "Zonk! Twoim zdaniem jest to #{params[:w]}, a powinno być #{usun_zera(session[:wynik])}"
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
