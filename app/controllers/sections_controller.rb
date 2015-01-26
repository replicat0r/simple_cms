class SectionsController < ApplicationController
  layout "admin"
  def new

  end
  def create
    @section = Section.new(section_params)
    if @section.save
      flash[:notice] =" #{@section.name} has been successful created"

      redirect_to :action => "index"
    else
      render 'new'
    end
  end

  def edit
    @section = Section.find(params[:id])
  end

  def update
    @section = Section.find(params[:id])

    if @section.update_attributes(section_params)
      flash[:notice] =" #{@section.name} has been successful updated"

      redirect_to :action => 'show' , :id => @section.id
    else
      render 'edit'
    end
  end

  def show
    @section = Section.find(params[:id])
  end

  def index
    @sections = Section.all
  end

  def delete
    @section = Section.find(params[:id])
  end
  def destroy
    @section = Section.find(params[:id]).destroy
    flash[:notice] =" #{@section.name} has been successful deleted"
    redirect_to :action => "index"
  end
  private
  def section_params
    params.require(:section).permit(:page_id,:name,:position,:visible,:content)
  end
end
