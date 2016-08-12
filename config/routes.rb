Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "cards#random"

  # Direct route
  get "random", to: "cards#random"

end
