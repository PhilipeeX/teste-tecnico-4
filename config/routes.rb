Rails.application.routes.draw do
  namespace :api do
    post '/import_csv', to: 'read_csv#import_csv'
  end

end
