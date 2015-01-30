class LandlordsController < ApplicationController
  layout 'admin'
  def index
    @landlords = Landlord.all
  end

  def show
  	@landlord = Landlord.find(params[:id]) 	
  end

  def import
    #take the file from params and send it to the model
    Landlord.import(params[:file])
    redirect_to :action => 'index'
    flash[:toastr] = ["success",'File Uploaded']
  end
  def new
  end
  def create
  end
  def edit
  end
  def update 
  	@landlord = Landlord.find(params[:id]) 	
  	if @landlord.update_attributes(landlords_params)
  		flash.now[:success]="record updated"
  		respond_to do |format|
  			format.html {redirect_to :action => "index"}
  			format.json {render :json => @landlord}
  		end
  	end
  end
  def delete
  end
  def destroy
  end

  private
   def landlords_params
   	params.require(:landlord).permit(:name, :address,:property_type,:bedroom,:email,:phone,:contacted_date,:email_used)
   end

end
