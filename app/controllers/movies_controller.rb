class MoviesController < ApplicationController

  def index
    @movies = Movie.all
  end

  def show 
    @movie = Movie.find(params[:id])
  end

  def new 
    @movie = Movie.new
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def create
    @movie = Movie.new(movie_params)
  
    if @movie.save
      redirect_to movies_path 
    else
      render :new  # am i calling new from line 11?
    end
  end

  def update
    @movie = Movie.find(params[:id])
  
    if @movie.update_attributes(movie_params) # what's this line doing?
      redirect_to movie_path(@movie) #diff bet. here and line 23
    else 
      render :new
    end
  end

  def destroy 
    @movie = Movie.find(params[:id])
    @movie.destroy
    redirect_to movies_path 
  end

  protected

  def movie_params 
    params.require(:movie).permit(
      :title, :release_date, :director, :runtime_in_minutes, :poster_image_url, :description, 
    )
  end

end
