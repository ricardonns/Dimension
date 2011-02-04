class ProductsController < ApplicationController

  respond_to :html, :xml, :json

  def index
    @products = Product.find_all_by_active true
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @products }
    end
  end

  def show
    @product = Product.find(params[:id])
    @sizes = Size.where(:active => true, :type_id => @product.type_id)
    @stock = @product.stocks.new
    respond_with [@product, @sizes, @stock]
  end

  def new
    @product = Product.new
    @types = Type.find_all_by_active true
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @product }
    end
  end

  def edit
    @product = Product.find(params[:id])
    @types = Type.find_all_by_active true
  end

  def create
    @product = Product.new(params[:product])

    flash[:notice] = 'Post was successfully created!' if @product.save
    respond_with @product, :location => products_path
  end

  def update
    @product = Product.find(params[:id])

    respond_to do |format|
      if @product.update_attributes(params[:product])
        format.html { redirect_to(@product, :notice => 'Product was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @product.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.active = false
    flash[:notice] = 'product was successfully removed!' if @product.save

    respond_with @product, :location => products_path

  end

end
