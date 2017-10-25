Rails.application.routes.draw do
  resources :pledges
  root "projects#index"
  # get "projects" => 'projects#index'
  # get "projects/new" => 'projects#new'
  # get "projects/:id" => 'projects#show', as: "project"
  # get "projects/:id/edit" => 'projects#edit', as: 'edit_project'
  # patch "projects/:id" => 'projects#update'
  resources :projects
end