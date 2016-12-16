Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # get '/', to: 'site#index'
  get '/', to: 'embassies#travel'
  get '/hotel_results', to: 'embassies#search', as: :search_results
  get '/embassies', to: 'embassies#show', as: :embassy_search
end
