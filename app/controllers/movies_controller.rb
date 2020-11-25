class MoviesController < ApplicationController
  def index
    if params[:query].present?
      @movies = Movie.search_by_title_and_syllabus(params[:query])

      # sql_query = "movies.title @@ :query \
      #              OR movies.syllabus @@ :query \
      #              OR directors.first_name @@ :query \
      #              OR directors.last_name @@ :query"
      # @movies = Movie.joins(:director).where(sql_query, query: "%#{params[:query]}%")

      # sql_query = "title ILIKE :query OR syllabus ILIKE :query"
      # @movies = Movie.where(sql_query, query: "%#{params[:query]}%")

      # @movies = Movie.where("title ILIKE ? OR syllabus ILIKE ?", "%#{params[:query]}%", "%#{params[:query]}%")
    else
      @movies = Movie.all
    end
  end
end
