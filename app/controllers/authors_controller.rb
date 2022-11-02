class AuthorsController < ApplicationController
  
  def index
    render json: Author.all
  end


  def show
    author = Author.find(params[:id])

    render json: author
  end

  def create
    author = Author.create(author_params)

    if author
    render json: author, status: :created
    else
      render json: {error: "Not created" }, status: 422
    end
  end

  private
  
  def author_params
    params.permit(:email, :name)
  end
  
end
