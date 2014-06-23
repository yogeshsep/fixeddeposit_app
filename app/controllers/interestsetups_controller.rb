class InterestsetupsController < ApplicationController
  def new
    @interestsetup =Interestsetup.new
  end

  def create
    @interestsetup =Interestsetup.new(params[:interestsetup])
    if @interestsetup.save
      flash[:success] = "FD Account Opened Successfully!"
      redirect_to interestsetups_path
    else
      flash[:error] = "Couldn't Setup Interest Rates"  
      render  'new'
    end
  end

  def index
    @interestsetup =Interestsetup.all
  end

  def show
    @interestsetup =Interestsetup.find(params[:id])
  end

  def update
    @interestsetup =Interestsetup.find(params[:id])
    if @interestsetup.update_attributes(params[:interestsetup])
        flash[:success] = "Updated your new Interest Rates"
        redirect_to interestsetups_path(@interestsetup)
      else
        flash[:alert] ="Fill the necessary fields"
        render 'edit'
      end
  end

  def destroy
    @interestsetup =Interestsetup.find(params[:id])
    @interestsetup.destroy
    flash[:notice] = "Your Interest Rates Get Deleted"
    redirect_to interestsetups_path
  end
end
