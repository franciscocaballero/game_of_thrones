Rails.application.routes.draw do
resources :house do
resources :characters

root 'welcome#index'
end
end
