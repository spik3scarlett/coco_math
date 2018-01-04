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


  # The priority is based upon order of creation: first created -> highest priority.

 
end
