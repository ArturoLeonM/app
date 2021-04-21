Rails.application.routes.draw do
  resources :productos do
    collection do 
      get :impr
      get :imprpdf
    end 
  
  end
  resources :tipos

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
