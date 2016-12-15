Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'site#index'
  get '/travel', to: 'embassies#travel'
  get '/travel/results', to: 'embassies#search', as: :search_results
  get '/travel/embassy', to: 'embassies#show', as: :embassy_search
end
