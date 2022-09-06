Rails.application.routes.draw do
  post "educational_institution", to: "educational_institution#create"
  get "educational_institution", to: "educational_institution#index"
  get "educational_institution/:id", to: "educational_institution#show"

  post "student", to: "students#create"
  get "student", to: "students#index"
  get "student/:id", to: "students#show"

  post "registration", to: "registrations#create"
  get "registration", to: "registrations#index"
  get "registration/:id", to: "registrations#show"

  get "invoice", to: "invoice#index"
  get "invoice/:id", to: "invoice#show"
end

