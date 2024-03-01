class KittensController < ApplicationController
  def index
    @kittens = Kitten.all
  end

  def show
    @kitten = Kitten.find(params[:id])
  end

  def new
    @kitten = Kitten.new
  end

  def create
    @kitten = Kitten.new(kitten_params)
    if @kitten.save
      redirect_to kitten_path(@kitten), notice: "New kitten has been created"
    else
      flash.now[:alert] = "Invalid input"
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @kitten = Kitten.find(params[:id])
  end

  def update
    @kitten = Kitten.find(params[:id])
    if @kitten.update(kitten_params)
      redirect_to kitten_path(@kitten), notice: "Kitten has been updated"
    else
      flash.now[:alert] = "Invalid input"
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    Kitten.find(params[:id]).destroy
    redirect_to kittens_path, notice: "Kitten has been deleted"
  end

  private

  def kitten_params
    params.require(:kitten).permit(:name, :age, :cuteness, :softness)
  end
end
