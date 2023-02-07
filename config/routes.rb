Rails.application.routes.draw do
  resources :spices, except: [:edit, :new, :show]
  # get '/spices', to:"spices#index"

end
