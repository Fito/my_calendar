MyCalendar::Application.routes.draw do
  resource :user, only: [:show, :create]
end
