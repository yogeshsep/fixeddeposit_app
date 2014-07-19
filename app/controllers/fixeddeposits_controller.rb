class FixeddepositsController < ApplicationController

before_filter :find_fixeddeposit, :only => [:show, :edit, :update, :destroy]

  def new
    @fixeddeposit =Fixeddeposit.new
  end

  def create
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

  def update
    if @fixeddeposit.update_attributes(params[:fixeddeposit])        
      redirect_to fixeddeposits_path(@fixeddeposit)
      flash.now[:success] = "Updated your FD Account"
    else
      flash[:alert] ="Fill the necessary fields"
      render 'edit'
    end
  end

  def destroy    
    @fixeddeposit.destroy    
    redirect_to fixeddeposits_path
    flash.now[:notice] = "Your FD Account Get Deleted"
  end

  protected    
    def find_fixeddeposit
      @fixeddeposit = Fixeddeposit.find(params[:id])
    end

  def calculate_age(dateofbirth)
    @age = DateTime.now - dateofbirth/ 365
    @age.save
  end

  def calculate_rateofinterest
    @periods = params[:periods]
    @dateofbirth = params[:dateofbirth]
    if @age >= 58 && @age < 75
        @rateofinterest = Rateofinterest.select('interestrates.id, interestrates.seniorincrement')
      elsif @age >= 75
        @rateofinterest = Rateofinterest.select('interestrates.id, interestrates.superseniorincrement') 
      else
        @rateofinterest = Rateofinterest.select('interestrates.id, interestrates.rate')
      end
    respond_to do |format|
      format.html{ redirect_to fixeddeposits_path }    
      format.js{}
      format.json{}
    end
  end

end
