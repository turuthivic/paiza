Rails.application.routes.draw do
 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'clients#landing_page', via: [:post, :get]
  get 'clients', to: 'clients#index'
end
