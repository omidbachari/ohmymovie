class FavoritesController < ApplicationController

def show
  @favorite = Favorite.find(params[:id])
end
def destroy
  @favorite = Favorite.find(params[:id])
  @favorite.destroy
  redirect_to users_path
  flash[:notice] = "You have removed a favorite."
end

end
