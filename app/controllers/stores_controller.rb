class StoresController < ApplicationController
  def index
    @stores = Store.all
  end

  def show
    @store = Store.includes(:transactions).find(params[:id])
  end
end
