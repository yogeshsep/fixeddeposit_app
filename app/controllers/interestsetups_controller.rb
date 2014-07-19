class InterestsetupsController < ApplicationController

 before_filter :find_interestsetup, :only => [:show, :edit, :update, :destroy]

  def new
    @interestsetup = Interestsetup.new
    @interestrate = @interestsetup.interestrates.build
  end

  def create
    @interestsetup = Interestsetup.new(params[:interestsetup])
    if @interestsetup.save
      flash[:success] = "New Interest Rate Commenced!"
      redirect_to interestsetup_path(@interestsetup)
    else
      flash[:error] = "Couldn't Setup Interest Rates"  
      render  'new'
    end
  end

  def index
    @interestsetup = Interestsetup.all
  end

  def update
    if @interestsetup.update_attributes(params[:interestsetup])
      flash[:success] = "Updated New Interest Rates"
      redirect_to interestsetups_path(@interestsetup)
    else
      flash[:alert] ="Fill the Necessary Fields"
      render 'edit'
    end
  end

  def destroy
    @interestsetup.destroy
    flash[:notice] = "Interest Rate Removed"
    redirect_to interestsetups_path
  end

 protected    
  def find_interestsetup
    @interestsetup = Interestsetup.find(params[:id])
  end
end
