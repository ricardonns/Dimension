class ProductsInfosController < ApplicationController

  respond_to :html, :xml, :json
  
  # GET /products_infos
  # GET /products_infos.xml
  def index
    @product = Product.find(params[:product_id])

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @products_infos }
    end
  end

  # GET /products_infos/1
  # GET /products_infos/1.xml
  def show
    @products_info = ProductsInfo.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @products_info }
    end
  end

  # GET /products_infos/new
  # GET /products_infos/new.xml
  def new
    @product = Product.find(params[:product_id])
    @products_info = @product.products_infos.new

    respond_with [@products_info, @product], :location => new_product_products_info_path(@product)
  end

  # GET /products_infos/1/edit
  def edit
    @products_info = ProductsInfo.find(params[:id])
  end

  # POST /products_infos
  # POST /products_infos.xml
  def create
    @product = Product.find(params[:product_id])
    @products_info = @product.products_infos.create(params[:products_info])

    respond_with @product, :location => product_products_infos_path(@product)
  end

  # PUT /products_infos/1
  # PUT /products_infos/1.xml
  def update
    @products_info = ProductsInfo.find(params[:id])

    respond_to do |format|
      if @products_info.update_attributes(params[:products_info])
        format.html { redirect_to(@products_info, :notice => 'Products info was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @products_info.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /products_infos/1
  # DELETE /products_infos/1.xml
  def destroy
    @product = Product.find(params[:product_id])
    @products_info = @product.products_infos.find(params[:id])
    @products_info.destroy

    respond_with @product, :location => product_products_infos_path(@product)
  end
end
