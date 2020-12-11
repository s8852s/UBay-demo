class StoresController < ApplicationController
  def index
    @stores = Store.all
  end

  def show
    @store = Store.find_by(id: params[:id])
  end

  def new
    @store = Store.new
  end

  def create
    @store = Store.new(params_stores)
    if @store.save
      redirect_to root_path, notice: "新增店家成功"
    else
      render :new
    end

    def edit
      @store = Store.find_by(id: params[:id])
    end

    def update
      @store = Store.find_by(id: params[:id])
      if @store.update(params_stores)
        redirect_to root_path, notice: '編輯店家成功'
      else
        render :edit
      end
    end

    def destroy
      @store = Store.find_by(id: params[:id])
      @store.destroy if @store
      redirect_to root_path, notice: "刪除店家成功"
    end

  end

  def params_stores
      params.require(:store).permit(:email, :name)
  end
end
