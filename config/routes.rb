Rails.application.routes.draw do
  root    'welcome#index'

  # these routes are for showing users a login form, logging them in, and logging them out.
  get     '/login'       =>     'sessions#new'
  post    '/login'       =>     'sessions#create'
  get     '/logout'     =>     'sessions#destroy'

  # these routes will be for signup. The first renders a form in the browse, the second will
  # receive the form and create a user in our database using the data given to us by the user.
  get     '/signup'    =>     'users#new'
  post    '/users'      =>    'users#create'

  resources :stocks do
    member do
      put "like", to: "stocks#upvote"
    end
  end
  resources :categories

  # link to your stockpile available to the public
  get '/:username', to: 'stocks#display', as: 'public_stock'
end
