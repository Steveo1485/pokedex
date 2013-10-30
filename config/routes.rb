Pokedex::Application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  root 'pokedex#index'

  resources :trainers do
    resources :pocket_monsters, only: [:index, :create]
  end
end
