Rails.application.routes.draw do
  devise_for :users
  get("/", { :controller => "places", :action => "index" })
  resources "entries"
  resources "places"
  resources "sessions"
  resources "users"
end
