class SubjectsController < ApplicationController
  layout "admin"

  def index
    @subjects = Subject.sorted

  end

  def show
    @subject = Subject.find(params[:id])
    respond_to do |format|
      format.html
      format.js
    end
  end

  def new

    @subject = Subject.new({:name => "Default"})
    @subject_count= Subject.count + 1

  end

  def create
    @subject = Subject.new(subject_params)
    if @subject.save
      #flash.now[:toastr] = ["success",'Subject #{@subject.name} successfully created']
      @subjects = Subject.all
      respond_to do |shenalie|
        shenalie.html {redirect_to(:action => "index")}
        shenalie.js

      end

    else
      @subject_count= Subject.count+1

      render('new')
    end
  end

  def edit
    @subject= Subject.find(params[:id])
    @subject_count= Subject.count
  end

  def update
    @subject= Subject.find(params[:id])

    if  @subject.update_attributes(subject_params)
      flash[:toastr] = ["success",'Subject #{@subject.name} successfully updated']
      #fetch all subject and store in @subject, so the view template can refresh the view
      @subjects = Subject.sorted

      respond_to do |format|
        format.html {  redirect_to(:action => "show", :id => @subject.id)}
        format.js
      end
    else
      @subject_count= Subject.count

      render('edit')
    end
  end

  def delete
    @subject = Subject.find(params[:id])
  end

  def destroy
    @subject = Subject.find(params[:id]).destroy
    flash[:toastr] = ["error",'Subject #{@subject.name} successfully deleted']
    redirect_to(:action =>'index')

  end

  private
  def subject_params
    params.require(:subject).permit(:name, :position,:visible)
  end

end
