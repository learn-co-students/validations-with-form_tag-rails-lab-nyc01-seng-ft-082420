class AuthorsController < ApplicationController
  def show
    @author = Author.find(params[:id])
  end

  def new
    @author = Author.new
  end

  def create
    @author = Author.create(author_params)

    if @author.is_valid?
      redirect_to author_path(@author)
    else
      @errors = @author.errors.full_messages
      redirect_to new_author_path(@author)
    end
  end

  def update
    @author = Author.find(params[:id])

    if @author.is_valid?
        @author.update(author_params)
        redirect_to author_path(@author)
    else
      @errors = @author.errors.full_messages
      redirect_to edit_author_path(@author)
    end
  end

  def edit
    @author = Author.find(params[:id])
  
  
  end

  private

  def author_params
    params.permit(:name, :email, :phone_number)
  end
end
