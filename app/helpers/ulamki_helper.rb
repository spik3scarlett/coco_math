module UlamkiHelper
  def ilerazuj
    b = rand(1..4)
    if b == 1 # podaj tyle razy większą
      @wynik == @ulamek3
      session[:wynik] = @ulamek3
      render html: "Bierzemy liczbę #{@ulamek1}. Podaj liczbę #{@ulamek2} razy większą."
    elsif b == 2 #podaj tyle razy mniejszą
      @wynik == @ulamek1
      session[:wynik] = @ulamek1
      render html: "Bierzemy liczbę #{@ulamek3}. Podaj liczbę #{@ulamek2} razy mniejszą."
    elsif b == 3 # podaj o tyle większą
      @wynik == @ulamek1
      session[:wynik] = @ulamek1
      render html: "Bierzemy liczbę #{@ulamek4}. Podaj liczbę o #{@ulamek2} większą."
    else  # czyli b == 4 - podaj o tyle mniejszą
      @wynik == @ulamek4
      session[:wynik] = @ulamek4
      render html: "Bierzemy liczbę #{@ulamek1}. Podaj liczbę o #{@ulamek2} mniejszą."
      
     end
    
    
  end
  
  def zaokraglij_naturalne
    session[:wynik] = @wynik
    render html: "Zaokrąglij liczbę #{@ulamek1} do rzędu #{@miejsce}."

  end
  
  def zaokraglij_ulamki
    session[:wynik] = @wynik
    render html: "Zaokrąglij liczbę #{@ulamek1} do #{@miejsce}."

  end
  
  
  
  
  def usun_zera(wynik)
  tablica = wynik.to_s.chars
    if tablica.include?(".")
    
      while tablica[-1] == "0" do
        tablica.pop
      end
      tablica.join
      
    else
      wynik.to_s
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
    elsif session[:rodzaj] == "jednostki"
      render html:  '<a href="/jednostki" classtype="button" class="btn btn-info" value="Input Button">Gram dalej</a>'.html_safe
    elsif session[:rodzaj] == "zaokraglanie_naturalnych"
      render html:  '<a href="/zaokraglanie-liczb-naturalnych" classtype="button" class="btn btn-info" value="Input Button">Gram dalej</a>'.html_safe
    elsif session[:rodzaj] == "zaokraglanie_ulamkow"
      render html:  '<a href="/zaokraglanie-ulamkow" classtype="button" class="btn btn-info" value="Input Button">Gram dalej</a>'.html_safe
    else # ilerazy
     render html:  '<a href="/ile-razy-o-ile" classtype="button" class="btn btn-info" value="Input Button">Gram dalej</a>'.html_safe
    
    end
  end
  
  def sprawdz
     if params[:w].include?(",")
       input = params[:w].sub!(",", ".").to_f
     else
       input = params[:w].to_f   
     end
    
    if input == session[:wynik].to_f
      if session[:punkty].nil?
        session[:punkty] = 1
      else
        session[:punkty] += 1
      end  
    render html: "Świetnie! Zdobywasz punkt! Liczba Twoich punktów: #{session[:punkty]}"
     else
    render html: "Pudło! Twoim zdaniem jest to #{params[:w]}, a powinno być #{usun_zera(session[:wynik])}"
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
