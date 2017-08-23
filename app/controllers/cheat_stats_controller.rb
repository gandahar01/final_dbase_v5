class CheatStatsController < ApplicationController
  before_action :current_user_must_be_cheat_stat_user, :only => [:show, :edit, :update, :destroy]

  def current_user_must_be_cheat_stat_user
    cheat_stat = CheatStat.find(params[:id])

    unless current_user == cheat_stat.user
      redirect_to :back, :alert => "You are not authorized for that."
    end
  end

  def index
    @q = current_user.cheat_stats.ransack(params[:q])
      @cheat_stats = @q.result(:distinct => true).includes(:user).page(params[:page]).per(10)

    render("cheat_stats/index.html.erb")
  end

  def show
    @cheat_stat = CheatStat.find(params[:id])

    render("cheat_stats/show.html.erb")
  end

  def new
    @cheat_stat = CheatStat.new

    render("cheat_stats/new.html.erb")
  end

  def create
    @cheat_stat = CheatStat.new

    @cheat_stat.calorie_bank = params[:calorie_bank]
    @cheat_stat.cheat_days_total = params[:cheat_days_total]
    @cheat_stat.workout_counter = params[:workout_counter]
    @cheat_stat.user_id = params[:user_id]

    save_status = @cheat_stat.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/cheat_stats/new", "/create_cheat_stat"
        redirect_to("/cheat_stats")
      else
        redirect_back(:fallback_location => "/", :notice => "Cheat stat created successfully.")
      end
    else
      render("cheat_stats/new.html.erb")
    end
  end

  def edit
    @cheat_stat = CheatStat.find(params[:id])

    render("cheat_stats/edit.html.erb")
  end

  def update
    @cheat_stat = CheatStat.find(params[:id])

    @cheat_stat.calorie_bank = params[:calorie_bank]
    @cheat_stat.cheat_days_total = params[:cheat_days_total]
    @cheat_stat.workout_counter = params[:workout_counter]
    @cheat_stat.user_id = params[:user_id]

    save_status = @cheat_stat.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/cheat_stats/#{@cheat_stat.id}/edit", "/update_cheat_stat"
        redirect_to("/cheat_stats/#{@cheat_stat.id}", :notice => "Cheat stat updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Cheat stat updated successfully.")
      end
    else
      render("cheat_stats/edit.html.erb")
    end
  end

  def destroy
    @cheat_stat = CheatStat.find(params[:id])

    @cheat_stat.destroy

    if URI(request.referer).path == "/cheat_stats/#{@cheat_stat.id}"
      redirect_to("/", :notice => "Cheat stat deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Cheat stat deleted.")
    end
  end
end
