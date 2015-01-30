class LandlordsController < ApplicationController
  layout 'admin'
  def index
  	@landlords = Landlord.all
  end

  def show
  end

  def import
  	#take the file from params and send it to the model
  	Landlord.import(params[:file])
  	redirect_to :action => 'index'

      flash[:toastr] = ["success",'File Uploaded']

  end
end
