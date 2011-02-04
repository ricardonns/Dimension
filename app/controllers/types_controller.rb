class TypesController < ApplicationController

  respond_to :html, :xml, :json

  def index
    @types = Type.find_all_by_active true
    @type = Type.new

    respond_with [@types, @type]
  end

  def edit
    @type = Type.find(params[:id])
    respond_with @type
  end

  def create
    @type = Type.new(params[:type])

    flash[:notice] = 'Type was successfully created!' if @type.save
    respond_with @type, :location => types_path
  end

  def update
    @type = Type.find(params[:id])

    flash[:notice] = 'Type was successfully saved!' \
      if @type.update_attributes(params[:type])

    respond_with @type, :location => types_path
  end

  def destroy
    @type = Type.find(params[:id])
    @type.active = false
    flash[:notice] = 'Type was successfully removed!' if @type.save

    respond_with @type, :location => types_path
  end

end
