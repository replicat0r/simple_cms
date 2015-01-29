class PagesController < ApplicationController
  layout "admin"
  # create
  def new
    @page = Page.new
          @page_count = Page.count+1

  end

  def create
    @page = Page.new(page_params)
    if @page.save
      flash[:toastr] = ["success",'page #{@page.name} successfully updated']

      redirect_to :action => 'index'
    else
      @page_count = Page.count+1
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
    @page_count = Page.count

  end

  def update
    @page = Page.find(params[:id])

    if @page.update_attributes(page_params)
      flash[:toastr] = ["success",'page #{@page.name} successfully updated']

      redirect_to :action => 'index'
    else
      @page_count = Page.count
      render 'edit'
    end

  end
  #delete
  def delete
    @page = Page.find(params[:id])

  end

  def destroy
    @page=Page.find(params[:id]).destroy
    flash[:toastr] = ["success",'page #{@page.name} successfully updated']
    redirect_to :action => 'index'
  end

  private
  def page_params
    params.require(:page).permit(:name,:permalink,:position,:visibility)
  end
end
