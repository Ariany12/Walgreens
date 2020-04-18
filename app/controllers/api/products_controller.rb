class Api::ProductsController < ApplicationController
  def index
    @products = Product.all
    render 'index.json.jb'
  end

  def show
    id = params[:id]
    @product = Product.find_by(id: id)
    render 'show.json.jb'
  end
  
  def create
    @product = Product.new(
      name: params[:name],
      price: params[:price],
      specificity: params[:specificity],
      quantity: params[:quantity],
    )
    if @product.save
      render json: {message: "You created a new product in your db"}
    else
     render json: {errors: @products.errors.full_messages, status: :unprocessable_entity}
    end
  end

  def update
    @product = Product.find_by(id: params[:id])
    @product.name = params[:name] ||@product.name
    @product.price =  params[:price] ||@product.price
    @product.specificity = params[:specificity] || @product.specificity
    @product.quantity = params[:quantity] ||  @product.quantity

    if @product.save
      render json: {message: "You product was update"}
    else
       render json: {errors: @product.errors.full_messages, status: :unprocessable_entity}
    end
  end 

  def destroy
    @product = Product.find_by(id: params[:id]) 
    if @product.delete
      render json: {message: "You product was deleted"}
    else
      render json: {errors: @product.errors.full_messages, status: :unprocessable_entity}
    end 
  end
end