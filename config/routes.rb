Rails.application.routes.draw do
  
  root 'static_pages#main'
  
  post '/', to: 'ulamki#wynik'
  get '/dzialanie', to: 'ulamki#dzialanie'
  get '/tabliczka', to: 'ulamki#tabliczka'
  get '/wynik',  to: 'ulamki#wynik'
  post "/dzialanie", to: 'ulamki#wynik'
  post '/tabliczka', to: 'ulamki#wynik'
  get '/jednostki', to: 'ulamki#jednostki'
  post '/jednostki', to: 'ulamki#wynik'
  get '/zaokraglanie-liczb-naturalnych', to: 'ulamki#zaokraglanie_naturalnych'
  post '/zaokraglanie-liczb-naturalnych', to: 'ulamki#wynik'
  get '/zaokraglanie-ulamkow', to: 'ulamki#zaokraglanie_ulamkow'
  post '/zaokraglanie-ulamkow', to: 'ulamki#wynik'
  get '/ile-razy-o-ile', to: 'ulamki#ilerazy'
  post '/ile-razy-o-ile', to: 'ulamki#wynik'
  get '/liczby-rzymskie', to: 'ulamki#rzymskie'
  post '/liczby-rzymskie', to: 'ulamki#wynik_stringi'
  get '/procenty', to: 'ulamki#procenty'
  post '/procenty', to: 'ulamki#wynik'
  get '/ary-hektary', to: 'ulamki#ary'
  post '/ary-hektary', to: 'ulamki#wynik'
  get '/ulamki-zwykle', to: 'ulamki#ulamki_zwykle'
  post '/ulamki-zwykle', to: 'ulamki#wynik_ulamki_zwykle'
  

  # The priority is based upon order of creation: first created -> highest priority.

 
end
