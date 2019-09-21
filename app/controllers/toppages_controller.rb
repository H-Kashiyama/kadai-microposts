class ToppagesController < ApplicationController
  def index
    if logged_in?
      @micropost = current_user.microposts.build
      @microposts = current_user.feed_microposts.order(id: :desc).page(params[:page])
    end
  end
  
  def likes
    @user = User.find(params[:id])
    @favoritings = @user.favoritings.page(params[:page])
    counts(@user)
  end
  
end
