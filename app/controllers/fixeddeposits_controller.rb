class FixeddepositsController < ApplicationController
  def new
    @fixeddeposit =Fixeddeposit.new
  end

  def create
    @fixeddeposit =Fixeddeposit.new(params[:fixeddeposit])
    if @fixeddeposit.save
      flash[:success] = "FD Account Opened Successfully!"
      redirect_to fixeddeposits_path
    else
      flash[:error] = "Couldn't Open FD"  
      render  'new'
    end
  end

  def index
    @fixeddeposit =Fixeddeposit.order('created_at DESC').paginate(:page => params[:page], :per_page => 8)
  end

  def show
    @fixeddeposit = Fixeddeposit.find(params[:id])
  end

  def edit
    @fixeddeposit = Fixeddeposit.find(params[:id])
  end

  def update
    @fixeddeposit = Fixeddeposit.find(params[:id])

      if @fixeddeposit.update_attributes(params[:fixeddeposit])
        flash[:success] = "Updated your FD Account"
        redirect_to fixeddeposits_path(@fixeddeposit)
      else
        flash[:alert] ="Fill the necessary fields"
        render 'edit'
      end
  end

  def destroy
    @fixeddeposit = Fixeddeposit.find(params[:id])
    @fixeddeposit.destroy
    flash[:notice] = "Your FD Account Get Deleted"
    redirect_to fixeddeposits_path
  end
end
