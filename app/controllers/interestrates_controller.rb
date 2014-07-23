class InterestratesController < ApplicationController
  def new
    @interestrate = Interestrate.new    
  end

  def create
    @interestrate = Interestrate.find(params[:interestrate])
    @interestrate.save
  end

  def index
    @interestrate = Interestrate.all
  end

  def show
    @interestrate = Interestrate.find(params[:id])
  end

  def edit    
  end

  def update
  end

  def destroy
  end
end
