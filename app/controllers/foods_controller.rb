class FoodsController < ApplicationController
  def index
    @foods = Food.page(params[:page]).per(10)

    render("foods/index.html.erb")
  end

  def show
    @foods_detail = FoodsDetail.new
    @cheat_food = CheatFood.new
    @food = Food.find(params[:id])

    render("foods/show.html.erb")
  end

  def new
    @food = Food.new

    render("foods/new.html.erb")
  end

  def create
    @food = Food.new

    @food.foods_name = params[:foods_name]
    @food.foods_category = params[:foods_category]
    @food.number_of_servings = params[:number_of_servings]
    @food.servings_unit = params[:servings_unit]
    @food.usda_ndb = params[:usda_ndb]
    @food.calories = params[:calories]

    save_status = @food.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/foods/new", "/create_food"
        redirect_to("/foods")
      else
        redirect_back(:fallback_location => "/", :notice => "Food created successfully.")
      end
    else
      render("foods/new.html.erb")
    end
  end

  def edit
    @food = Food.find(params[:id])

    render("foods/edit.html.erb")
  end

  def update
    @food = Food.find(params[:id])

    @food.foods_name = params[:foods_name]
    @food.foods_category = params[:foods_category]
    @food.number_of_servings = params[:number_of_servings]
    @food.servings_unit = params[:servings_unit]
    @food.usda_ndb = params[:usda_ndb]
    @food.calories = params[:calories]

    save_status = @food.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/foods/#{@food.id}/edit", "/update_food"
        redirect_to("/foods/#{@food.id}", :notice => "Food updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Food updated successfully.")
      end
    else
      render("foods/edit.html.erb")
    end
  end

  def destroy
    @food = Food.find(params[:id])

    @food.destroy

    if URI(request.referer).path == "/foods/#{@food.id}"
      redirect_to("/", :notice => "Food deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Food deleted.")
    end
  end
end
