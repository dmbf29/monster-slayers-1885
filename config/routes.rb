Rails.application.routes.draw do
  resources :houses, only: [:show] do
    resources :monsters, only: [:new, :create]
  end
  resources :monsters, only: [:destroy] do
    resources :curses, only: [:new, :create]
  end
end
# As a user I can see one haunted house's monsters
# houses#show
# get '/houses/:id', to: 'houses#show', as: :house

# As a user I can condemn a monster in a haunted house
# monsters#new / monsters#create
# get 'houses/:house_id/monsters/new'
# post 'houses/:house_id/monsters'

# As a user I can release a monster
# monsters#destroy
# delete 'monsters/:id'

# As a user I add a power to a monster (creating a curse)
# curses#new/create
# get 'monsters/:monster_id/curses/new'
# post 'monsters/:monster_id/curses'
