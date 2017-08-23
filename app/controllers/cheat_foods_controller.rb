class CheatFoodsController < ApplicationController
  def index
    @cheat_foods = CheatFood.all

    render("cheat_foods/index.html.erb")
  end

  def show
    @cheat_food = CheatFood.find(params[:id])

    render("cheat_foods/show.html.erb")
  end

  def new
    @cheat_food = CheatFood.new

    render("cheat_foods/new.html.erb")
  end

  def create
    @cheat_food = CheatFood.new

    @cheat_food.servings = params[:servings]
    @cheat_food.day_of_cheat = params[:day_of_cheat]
    @cheat_food.user_id = params[:user_id]
    @cheat_food.foods_id = params[:foods_id]

    save_status = @cheat_food.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/cheat_foods/new", "/create_cheat_food"
        redirect_to("/cheat_foods")
      else
        redirect_back(:fallback_location => "/", :notice => "Cheat food created successfully.")
      end
    else
      render("cheat_foods/new.html.erb")
    end
  end

  def edit
    @cheat_food = CheatFood.find(params[:id])

    render("cheat_foods/edit.html.erb")
  end

  def update
    @cheat_food = CheatFood.find(params[:id])

    @cheat_food.servings = params[:servings]
    @cheat_food.day_of_cheat = params[:day_of_cheat]
    @cheat_food.user_id = params[:user_id]
    @cheat_food.foods_id = params[:foods_id]

    save_status = @cheat_food.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/cheat_foods/#{@cheat_food.id}/edit", "/update_cheat_food"
        redirect_to("/cheat_foods/#{@cheat_food.id}", :notice => "Cheat food updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Cheat food updated successfully.")
      end
    else
      render("cheat_foods/edit.html.erb")
    end
  end

  def destroy
    @cheat_food = CheatFood.find(params[:id])

    @cheat_food.destroy

    if URI(request.referer).path == "/cheat_foods/#{@cheat_food.id}"
      redirect_to("/", :notice => "Cheat food deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Cheat food deleted.")
    end
  end
end
