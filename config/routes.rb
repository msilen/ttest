Ttest::Application.routes.draw do
  resources :lots

  root :to => "lots#index"
end
