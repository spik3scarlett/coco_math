Rails.application.routes.draw do
  get '/dzialanie', to: 'ulamki#dzialanie'

  get '/wynik',  to: 'ulamki#wynik'
  post "/dzialanie", to: 'ulamki#wynik'


  # The priority is based upon order of creation: first created -> highest priority.

 
end
