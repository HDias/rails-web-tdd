Rails.application.routes.draw do
  get 'customers/index'
  root to: 'welcome#index'
  resources :customers
end
