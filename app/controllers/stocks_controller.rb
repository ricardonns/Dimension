class StocksController < ApplicationController

  respond_to :html, :xml, :json

  def create
    @product = Product.find(params[:product_id])
    @stock = Stock.new(params[:stock])
    @stock.product_id = @product.id
    flash[:notice] = 'Stock was successfully created!' if @stock.save
    respond_with @stock, :location => products_path
  end

  def destroy
  end

  def edit
  end

  def update
  end

end
