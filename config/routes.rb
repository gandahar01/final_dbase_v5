Rails.application.routes.draw do
  # Routes for the Nutrient resource:
  # CREATE
  get "/nutrients/new", :controller => "nutrients", :action => "new"
  post "/create_nutrient", :controller => "nutrients", :action => "create"

  # READ
  get "/nutrients", :controller => "nutrients", :action => "index"
  get "/nutrients/:id", :controller => "nutrients", :action => "show"

  # UPDATE
  get "/nutrients/:id/edit", :controller => "nutrients", :action => "edit"
  post "/update_nutrient/:id", :controller => "nutrients", :action => "update"

  # DELETE
  get "/delete_nutrient/:id", :controller => "nutrients", :action => "destroy"
  #------------------------------

  # Routes for the Cheat_stat resource:
  # CREATE
  get "/cheat_stats/new", :controller => "cheat_stats", :action => "new"
  post "/create_cheat_stat", :controller => "cheat_stats", :action => "create"

  # READ
  get "/cheat_stats", :controller => "cheat_stats", :action => "index"
  get "/cheat_stats/:id", :controller => "cheat_stats", :action => "show"

  # UPDATE
  get "/cheat_stats/:id/edit", :controller => "cheat_stats", :action => "edit"
  post "/update_cheat_stat/:id", :controller => "cheat_stats", :action => "update"

  # DELETE
  get "/delete_cheat_stat/:id", :controller => "cheat_stats", :action => "destroy"
  #------------------------------

  # Routes for the Food resource:
  # CREATE
  get "/foods/new", :controller => "foods", :action => "new"
  post "/create_food", :controller => "foods", :action => "create"

  # READ
  get "/foods", :controller => "foods", :action => "index"
  get "/foods/:id", :controller => "foods", :action => "show"

  # UPDATE
  get "/foods/:id/edit", :controller => "foods", :action => "edit"
  post "/update_food/:id", :controller => "foods", :action => "update"

  # DELETE
  get "/delete_food/:id", :controller => "foods", :action => "destroy"
  #------------------------------

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
