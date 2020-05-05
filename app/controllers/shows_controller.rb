class ShowsController < ApplicationController

  def faviourite
    case params[:type]
    when "faviourite"
      faviourite_show = FaviouriteShow.new(user_id: params[:user_id], show_id: params[:id])
      if faviourite_show.present? && faviourite_show.save
        UserMailer.added_to_faviourites(current_user, params[:id]).deliver_now
        redirect_to root_path
      else
        flash[:error] = "Something went wrong"
      end
    when "unfaviourite"
      faviourite_show = FaviouriteShow.find_by_show_id(params[:id])
      if faviourite_show.present? && faviourite_show.destroy
        UserMailer.removed_from_faviourites(current_user, params[:id]).deliver_now
        redirect_to root_path
      else
        flash[:error] = "Somwthing went wrong"
      end
    end
  end

  def schedule_mail
    shows = Show.find(current_user.faviourite_shows.pluck(:show_id))
    shows.each do|show|
      UserMailer.upcoming_show(current_user, show).deliver_now if ((Time.now - Time.parse(show.time_slot.from.time.strftime("%T")))/1.minute).round <= 30
    end
    return true
  end

end
