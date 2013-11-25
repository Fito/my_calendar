MyCalendar::Application.routes.draw do
  resource :user, only: [:show, :create]
  resources :events, only: [:index, :create]
end
