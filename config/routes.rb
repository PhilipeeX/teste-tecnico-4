Rails.application.routes.draw do
  namespace :api do
    post '/read_csv', to: 'read_csv#read_csv'
  end

end
