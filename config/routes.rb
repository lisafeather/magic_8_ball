Magic8Ball::Application.routes.draw do
 
  root to: "questions#index"

  resources :answers, :questions
end
