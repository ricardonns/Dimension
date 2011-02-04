class SizesController < ApplicationController

  respond_to :html, :xml, :json

  def index
    @sizes = Size.find_all_by_active true
    @size = Size.new
    @types = Type.find_all_by_active true
    respond_with [@sizes, @size], :location => sizes_path
  end

  def edit
    @size = Size.find(params[:id])
    @types = Type.find_all_by_active true
    respond_with @size
  end

  def create
    @size = Size.new(params[:size])

    flash[:notice] = 'Size was successfully created!' if @size.save
    respond_with @size, :location => sizes_path
  end

  def update
    @size = Size.find(params[:id])
    
    flash[:notice] = 'Size was successfully saved!' \
      if @size.update_attributes(params[:size])

    respond_with @size, :location => sizes_path
  end

  def destroy
    @size = Size.find(params[:id])
    @size.active = false
    flash[:notice] = 'Size was successfully removed!' if @size.save

    respond_with @size, :location => sizes_path
  end

end
