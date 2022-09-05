Rails.application.routes.draw do
  # Educational institutions Routes
  post "educational_institution", to: "educational_institution#create"
  get "educational_institution", to: "educational_institution#index"
  get "educational_institution/:id", to: "educational_institution#show"
end
