module UlamkiHelper
  
  def ujemnuj
    ulamek1 = rand(-20..20)
    ulamek2 = rand(-20..20)
    ulamek3 = rand(-20..20)
    operator1 = ["+", "-"].sample
    operator2 = ["+", "-"].sample
    if ulamek2 > 0 || ulamek2 == 0
      ulamek2string = "#{ulamek2}"
      else
        ulamek2string = "(#{ulamek2})"
    end
    if ulamek3 > 0 || ulamek3 == 0
      ulamek3string = "#{ulamek3}"
      else
        ulamek3string = "(#{ulamek3})"
    end
      
    dzialanie = "#{ulamek1}" + "#{operator1}" + "#{ulamek2string}" + "#{operator2}" + "#{ulamek3string}"
    session[:wynik] = eval dzialanie
    render html: "Ile to będzie: #{dzialanie} ?"
  end
  
  def zwykluj
    
    @wybor = 2 # rand(1..2)
    
    #rodzaj zadania: odejmij ulamki zwykle, poziom prosty
    #rodzaj zadania: mnoz ulamki zwykle, poziom prosty
    #rodzaj zadania: dziel ulamki zwykle, poziom prosty
    #rodzaj zadania: te same ale z liczbami calkowitaymi z przodu
    
    if @wybor == 1
      #rodzaj zadania: policz ulamek z liczby 
      @ulamek2 = rand(2..9)
      @ulamek1 = rand(1...@ulamek2)
        dzielniki = [2, 3]
        3.times do
          dzielniki.each {|dzielnik|
          if @ulamek2 % dzielnik == 0 && @ulamek1 % dzielnik == 0
            @ulamek2 = @ulamek2 / dzielnik
            @ulamek1 = @ulamek1 / dzielnik
            
          end
          }
        end
      @ulamek4 = rand(1..20) * @ulamek2
      @ulamek3 = @ulamek4 / @ulamek2 * @ulamek1
      session[:wynik] = @ulamek3
      return nil

    elsif @wybor == 2
      #rodzaj zadania: dodaj ulamki zwykle, poziom prosty
      @ulamek2 = rand(2..9)
      @ulamek1 = rand(1...@ulamek2)
      @ulamek4 = rand(2..9)
      @ulamek3 = rand(1...@ulamek4)
      wspolny_mianownik = @ulamek2 * @ulamek4
      ulamek1_po_rozszerzeniu = @ulamek4 * @ulamek1
      ulamek3_po_rozszerzeniu = @ulamek2 * @ulamek3
      licznik_wyniku = ulamek1_po_rozszerzeniu + ulamek3_po_rozszerzeniu
      until licznik_wyniku.gcd(wspolny_mianownik) == 1 do
        gcd = licznik_wyniku.gcd(wspolny_mianownik)
        licznik_wyniku = licznik_wyniku /  gcd
        wspolny_mianownik = wspolny_mianownik / gcd
      end
      
      if licznik_wyniku > wspolny_mianownik
        calosci = licznik_wyniku / wspolny_mianownik
        licznik_wyniku = licznik_wyniku % wspolny_mianownik
        session[:wynik] = [licznik_wyniku, wspolny_mianownik, calosci]
        
      else
        session[:wynik] = [licznik_wyniku, wspolny_mianownik]
      end
      return nil
    else
      
    end
   

  end
  
  def aruj
    pola = [["m<sup>2</sup>", "metrów kwadratowych", 1], ["a", "arów", 100], ["ha", "hektarów", 10000], ["km<sup>2</sup>", "kilometrów kwadratowych", 1000000]]
    pola.shuffle!
    @pole1 = pola.pop
    @pole2 = pola.pop
    @ulamek1 = rand(1.0..20.0).to_f.round(1)
    session[:wynik] = (@ulamek1 * @pole1[2] / @pole2[2]).round(8)
    return nil
    
  end

  def procentuj  
 
    @b = 0
    @a = 0
    @procent = 0
  # losowa metoda ustalenia % i zmiennych @a i @b; konczy sie ustaleniem tych zmiennych  @procent /100 = a/b
    wariacja_ustalenia = rand(1..7)
    if wariacja_ustalenia <=2
      # metoda 1 dowolna liczba z 00 na końcu daje 1 proc. równy liczbie bez zer
      @b = rand(10..99) * 100
      @procent = rand(1..99)
      @a = @procent * @b / 100
      
    else 
        tabela = [[20, rand(1..20)], [10, rand(1..9)], [5, rand(1..4)], [4, rand(1..3)], [2, 1]]

        wybrana_para = tabela.sample
        mnoznik = wybrana_para[1]
        if wariacja_ustalenia <7
          # metoda 2 używamy 5% (1/20), 10% (/10), 20% (1/5), 25% (1/4) i wielokrotności oraz 50% (1/2)
          @procent = (100 / wybrana_para[0]) * mnoznik
        else
          # metoda 3 te z metody2 ale +100%, 200%, 300%
          n = [100, 200, 300]
          @procent = (100 / wybrana_para[0]) * mnoznik + n.sample
        end
        
        @b = rand(2..20) * wybrana_para[0] 
        @a = @procent * @b / 100
    end
    
   #teraz ustalamy o co sie pytamy
    
      wariacja_pytania = rand(1..3)
        if wariacja_pytania == 1 # oblicz procent z liczby
        session[:wynik] = @a
        render html: "Podaj, ile wynosi #{@procent}% z liczby #{@b}."
        
        elsif wariacja_pytania == 2 # znasz procent, podaj liczbę
        session[:wynik] = @b
        render html: "#{@procent}% pewnej liczby wynosi #{@a}. Co to za liczba?"
        
        else # wariacja == 3 # podaj jakim % drugiej liczby jest dana liczba
        session[:wynik] = @procent
        render html: "Podaj, jaki procent liczby #{@b} stanowi liczba #{@a}."
        
        end
    

    
  end
  
  def ilerazuj
    b = rand(1..4)
    if b == 1 # podaj tyle razy większą
      @wynik = @ulamek3
      session[:wynik] = @ulamek3
      render html: "Bierzemy liczbę #{@ulamek1}. Podaj liczbę #{@ulamek2} razy większą."
    elsif b == 2 #podaj tyle razy mniejszą
      @wynik = @ulamek1
      session[:wynik] = @ulamek1
      render html: "Bierzemy liczbę #{@ulamek3}. Podaj liczbę #{@ulamek2} razy mniejszą."
    elsif b == 3 # podaj o tyle większą
      @wynik = @ulamek1
      session[:wynik] = @ulamek1
      render html: "Bierzemy liczbę #{@ulamek4}. Podaj liczbę o #{@ulamek2} większą."
    else  # czyli b == 4 - podaj o tyle mniejszą
      @wynik = @ulamek4
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
    elsif session[:rodzaj] == "ilerazy"
     render html:  '<a href="/ile-razy-o-ile" classtype="button" class="btn btn-info" value="Input Button">Gram dalej</a>'.html_safe
    elsif session[:rodzaj] == "rzymskie"
     render html:  '<a href="/liczby-rzymskie" classtype="button" class="btn btn-info" value="Input Button">Gram dalej</a>'.html_safe
    elsif session[:rodzaj] == "procenty"
     render html:  '<a href="/procenty" classtype="button" class="btn btn-info" value="Input Button">Gram dalej</a>'.html_safe
    elsif session[:rodzaj] == "ary"
     render html:  '<a href="/ary-hektary" classtype="button" class="btn btn-info" value="Input Button">Gram dalej</a>'.html_safe
    elsif session[:rodzaj] == "ulamki_zwykle"
     render html:  '<a href="/ulamki-zwykle" classtype="button" class="btn btn-info" value="Input Button">Gram dalej</a>'.html_safe 
    else #liczby_ujemne
    render html:  '<a href="/liczby-ujemne" classtype="button" class="btn btn-info" value="Input Button">Gram dalej</a>'.html_safe 
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

  def sprawdz_ulamki_zwykle
    input = [params[:licznik], params[:mianownik]]   
    if input[0].to_i == session[:wynik][0].to_i && input[1].to_i == session[:wynik][1].to_i
      if session[:punkty].nil?
        session[:punkty] = 1
      else
        session[:punkty] += 1
      end  
      @rezultat = 1
    # render html: "Świetnie! Zdobywasz punkt! Liczba Twoich punktów: #{session[:punkty]}"
     else
       @rezultat = 0
   #  render html: "Pudło! Twoim zdaniem jest to #{params[:licznik]} / #{params[:mianownik]}, a powinno być #{(session[:wynik])}."
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
  
  def romanize(number)
	result = ""	  #converts an int to a roman numeral string
  	$numerals.each do |digit, letter|
  		if number >= digit
	  		result << letter*(number/digit) # string multiplication in ruby only works with whole numbers
	  		number = (number % digit) #removes the parts of the number already added or leaves it the same otherwise 
	  	end
  	end
  	return result 
  end

def arabicize(numeral)
	result = 0
	$numerals.each do |digit, letter|
		while numeral.start_with?(letter) do
			result = result + digit
			numeral = numeral.slice(letter.length,numeral.length) #
		end
	end
	return result	
end

	$numerals = {
	    1000 => "M",  
	     900 => "CM",  
	     500 => "D",  
	     400 => "CD",
	     100 => "C",  
	      90 => "XC",  
	      50 => "L",  
	      40 => "XL",  
	      10 => "X",  
	        9 => "IX",  
	        5 => "V",  
	        4 => "IV",  
	        1 => "I",  
  				}
  
  def konwertuj_rzymskie
    @wynik = romanize(@ulamek1)
    wariacja = rand(1..2)
    if wariacja == 1
      session[:wynik] = @wynik
      render html: "Zapisz #{@ulamek1} cyframi rzymskimi."
    else
      session[:wynik] = @ulamek1.to_s
      render html: "Zapisz cyframi arabskimi liczbę rzymską: #{@wynik}."
    end
    
  end
  
  def sprawdz_stringi
    input = params[:w]
    if input == session[:wynik]
      if session[:punkty].nil?
        session[:punkty] = 1
      else
        session[:punkty] += 1
      end  
    render html: "Świetnie! Zdobywasz punkt! Liczba Twoich punktów: #{session[:punkty]}"
     else
    render html: "Pudło! Twoim zdaniem jest to #{params[:w]}, a powinno być #{session[:wynik]}"
    end
  end
  
end
