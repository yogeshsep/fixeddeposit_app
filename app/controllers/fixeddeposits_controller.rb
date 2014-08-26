class FixeddepositsController < ApplicationController

  def new
    @fixeddeposit =Fixeddeposit.new
  end

  def create
    sleep 2
    @fixeddeposit =Fixeddeposit.new(params[:fixeddeposit])
    if @fixeddeposit.save      
      redirect_to fixeddeposits_path
      flash.now[:success] = "FD Account Opened Successfully!"
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
        redirect_to fixeddeposits_path(@fixeddeposit)
        flash.now[:success] = "Updated your FD Account"
      else
        flash[:alert] ="Fill the necessary fields"
        render 'edit'
      end
  end

  def destroy
    @fixeddeposit = Fixeddeposit.find(params[:id])
    @fixeddeposit.destroy    
    redirect_to fixeddeposits_path
    flash.now[:notice] = "Your FD Account Get Deleted"
  end

  def calculate_rateofinterest
    respond_to do |format|
      format.html do
      render "index"
      end
      format.json do
        interestrate = Interestrate.find_by_effectivefrom(params[:periods])
        data = {}
      if interestrate_rate.present?
        data = {:rateofinterest => interestrate.rate}
      else
        t1 = DateTime.strptime(params[:openedon], "%d-%m-%Y") 
        t2 = DateTime.now
        data = {:rateofinterest => (t2-t1).to_f*0.25}
      end
        render :json => data
      end
    end 
  end

end
