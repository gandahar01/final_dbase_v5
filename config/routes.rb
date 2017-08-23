Rails.application.routes.draw do
  # Routes for the Cheat_food resource:
  # CREATE
  get "/cheat_foods/new", :controller => "cheat_foods", :action => "new"
  post "/create_cheat_food", :controller => "cheat_foods", :action => "create"

  # READ
  get "/cheat_foods", :controller => "cheat_foods", :action => "index"
  get "/cheat_foods/:id", :controller => "cheat_foods", :action => "show"

  # UPDATE
  get "/cheat_foods/:id/edit", :controller => "cheat_foods", :action => "edit"
  post "/update_cheat_food/:id", :controller => "cheat_foods", :action => "update"

  # DELETE
  get "/delete_cheat_food/:id", :controller => "cheat_foods", :action => "destroy"
  #------------------------------

  devise_for :users
  # Routes for the User resource:
  # READ
  get "/users", :controller => "users", :action => "index"
  get "/users/:id", :controller => "users", :action => "show"


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
