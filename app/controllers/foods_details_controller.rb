class FoodsDetailsController < ApplicationController
  def index
    @foods_details = FoodsDetail.all

    render("foods_details/index.html.erb")
  end

  def show
    @foods_detail = FoodsDetail.find(params[:id])

    render("foods_details/show.html.erb")
  end

  def new
    @foods_detail = FoodsDetail.new

    render("foods_details/new.html.erb")
  end

  def create
    @foods_detail = FoodsDetail.new

    @foods_detail.foods_details_quantity = params[:foods_details_quantity]
    @foods_detail.foods_id = params[:foods_id]
    @foods_detail.nutrients_id = params[:nutrients_id]

    save_status = @foods_detail.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/foods_details/new", "/create_foods_detail"
        redirect_to("/foods_details")
      else
        redirect_back(:fallback_location => "/", :notice => "Foods detail created successfully.")
      end
    else
      render("foods_details/new.html.erb")
    end
  end

  def edit
    @foods_detail = FoodsDetail.find(params[:id])

    render("foods_details/edit.html.erb")
  end

  def update
    @foods_detail = FoodsDetail.find(params[:id])

    @foods_detail.foods_details_quantity = params[:foods_details_quantity]
    @foods_detail.foods_id = params[:foods_id]
    @foods_detail.nutrients_id = params[:nutrients_id]

    save_status = @foods_detail.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/foods_details/#{@foods_detail.id}/edit", "/update_foods_detail"
        redirect_to("/foods_details/#{@foods_detail.id}", :notice => "Foods detail updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Foods detail updated successfully.")
      end
    else
      render("foods_details/edit.html.erb")
    end
  end

  def destroy
    @foods_detail = FoodsDetail.find(params[:id])

    @foods_detail.destroy

    if URI(request.referer).path == "/foods_details/#{@foods_detail.id}"
      redirect_to("/", :notice => "Foods detail deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Foods detail deleted.")
    end
  end
end
