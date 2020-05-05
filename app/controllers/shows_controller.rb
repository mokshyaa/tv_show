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

end
