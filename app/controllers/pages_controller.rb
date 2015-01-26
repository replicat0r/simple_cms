class PagesController < ApplicationController
  layout "admin"
  # create
  def new
    @page = Page.new
  end

  def create
    @page = Page.new(page_params)
    if @page.save
      flash[:notice] ="#{@page.name} has been successfully created"

      redirect_to :action => 'index'
    else
      render 'new'
    end

  end
  #read
  def index
    @pages = Page.all
  end

  def show
    @page = Page.find(params[:id])
  end
  def edit
    @page = Page.find(params[:id])

  end

  def update
    @page = Page.find(params[:id])

    if @page.update_attributes(page_params)
      flash[:notice] ="#{@page.name} has been successfully updated"

      redirect_to :action => 'index'
    else
      render 'edit'
    end

  end
  #delete
  def delete
    @page = Page.find(params[:id])

  end

  def destroy
    @page=Page.find(params[:id]).destroy
    flash[:notice] ="#{@page.name} has been successfully deleted"
    redirect_to :action => 'index'
  end

  private
  def page_params
    params.require(:page).permit(:name,:permalink,:position,:visibility)
  end
end
