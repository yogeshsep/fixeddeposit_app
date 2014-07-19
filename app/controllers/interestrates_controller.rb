class InterestratesController < ApplicationController

 before_filter :find_interestrate, :only => [:show, :edit, :update, :destroy]

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

  def update
  end

  def destroy
  end

 protected    
  def find_interestrate
    @interestrate = Interestrate.find(params[:id])
  end
end
