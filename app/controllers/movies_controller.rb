class MoviesController < ApplicationController

  before_action :authenticate_user!, only: [:new, :create]

def index
  
  @rank_movies = Movie.all.sort {|a,b| b.liked_users.count <=> a.liked_users.count}.first (9)
  
  if params[:search] == nil
    @movies= Movie.all.page(params[:page]).per(10)
  elsif params[:search] == ''
    @movies= Movie.all.page(params[:page]).per(10)
  else
    #部分検索
    @movies = Movie.where("title LIKE ? ",'%' + params[:search] + '%').page(params[:page]).per(3)
  end


end


def  show

  @movie = Movie.find(params[:id])
end

def new
  @movie = Movie.new

end

def create

  movie = Movie.new(movie_params)

  movie.user_id = current_user.id

  if movie.save
    redirect_to :action => "index"
  else
    redirect_to :action => "new"
  
  end

end

def edit
  @movie = Movie.find(params[:id])
end

def update
  movie = Movie.find(params[:id])
  if movie.update(movie_params)
    redirect_to :action => "show", :id => movie.id
  else
    redirect_to :action => "new"
  end
end

def destroy
  movie = Movie.find(params[:id])
  movie.destroy
  redirect_to action: :index
end

private
  def movie_params
    params.require(:movie).permit(:title, :released_year, :rating, :reflections, :image)
  
end


end

