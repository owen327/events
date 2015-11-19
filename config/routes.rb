Rails.application.routes.draw do
  resources :categories

  resource :session

  get "signup" => "users#new"
  resources :users

  root "events#index"
#  get "events" => "events#index"
#  get "events/new" => "events#new"
#  get "events/:id" => "events#show", as: "event"
#  get "events/:id/edit" => "events#edit", as: "edit_event"
#  patch "events/:id" => "events#update"

  get "events/filter/:scope" => "events#index", as: :filtered_events
  resources :events do
    resources :registrations
    resources :likes
  end

end
