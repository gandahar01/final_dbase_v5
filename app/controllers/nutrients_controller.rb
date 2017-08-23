class NutrientsController < ApplicationController
  def index
    @q = Nutrient.ransack(params[:q])
    @nutrients = @q.result(:distinct => true).includes(:foods_details, :cheat_foods, :foods).page(params[:page]).per(10)

    render("nutrients/index.html.erb")
  end

  def show
    @foods_detail = FoodsDetail.new
    @nutrient = Nutrient.find(params[:id])

    render("nutrients/show.html.erb")
  end

  def new
    @nutrient = Nutrient.new

    render("nutrients/new.html.erb")
  end

  def create
    @nutrient = Nutrient.new

    @nutrient.nutrients_category = params[:nutrients_category]
    @nutrient.nutrients_unit_of_measure = params[:nutrients_unit_of_measure]
    @nutrient.nutrients_name = params[:nutrients_name]

    save_status = @nutrient.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/nutrients/new", "/create_nutrient"
        redirect_to("/nutrients")
      else
        redirect_back(:fallback_location => "/", :notice => "Nutrient created successfully.")
      end
    else
      render("nutrients/new.html.erb")
    end
  end

  def edit
    @nutrient = Nutrient.find(params[:id])

    render("nutrients/edit.html.erb")
  end

  def update
    @nutrient = Nutrient.find(params[:id])

    @nutrient.nutrients_category = params[:nutrients_category]
    @nutrient.nutrients_unit_of_measure = params[:nutrients_unit_of_measure]
    @nutrient.nutrients_name = params[:nutrients_name]

    save_status = @nutrient.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/nutrients/#{@nutrient.id}/edit", "/update_nutrient"
        redirect_to("/nutrients/#{@nutrient.id}", :notice => "Nutrient updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Nutrient updated successfully.")
      end
    else
      render("nutrients/edit.html.erb")
    end
  end

  def destroy
    @nutrient = Nutrient.find(params[:id])

    @nutrient.destroy

    if URI(request.referer).path == "/nutrients/#{@nutrient.id}"
      redirect_to("/", :notice => "Nutrient deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Nutrient deleted.")
    end
  end
end
