class UserMailer < ApplicationMailer
  default :from => "moksh.panchal@green-apex.com"

  def added_to_faviourites(user, show_id)
    @user = user
    @show = Show.find(show_id)
    mail(:to => user.email, :subject => "You have added show #{@show.name} to faviourites")
  end

  def removed_from_faviourites(user, show_id)
    @user = user
    @show = Show.find(show_id)
    mail(:to => user.email, :subject => "You have removed show #{@show.name} from faviourites")
  end

  def upcoming_show(user, show)
    @user = user
    @show = show
    mail(:to => user.email, :subject => "Your faviourite show #{@show.name} telecasted soon")
  end
end
