class ProductsController < ApplicationController
  def index
    @store = Store.find_by(id: params[:store_id])
    @products = Product.all
  end

  def show
    @product = Product.find_by(id: params[:id])
    @store = @product.store
  end

  def new
    @store = Store.find_by(id: params[:store_id])
    @product = Product.new
  end

  def create
    @store = Store.find_by(id: params[:store_id])
    @product = Product.new(params_product)
    @product.store = @store
    
    if @product.save
      redirect_to store_productlist_path(@store), notice: "新增產品成功"
    else
      render :new
    end
  end

  def edit
    @product = Product.find_by(id: params[:id])
  end

  def update
    @product = Product.find_by(id: params[:id])
    if @product.update(params_product)
      redirect_to product_path(@product), notice: '編輯商品成功'
    else
      render :edit
    end
  end

  def destroy
    # @store = Store.find_by(id: params[:store_id])
    @product = Product.find_by(id: params[:id])
    @store = @product.store
    @product.destroy if @product
    # redirect_to root_path, notice: '刪除商品成功'
    redirect_to store_productlist_path(@store), notice: '刪除商品成功'
  end

  private
  def params_product
      params.require(:product).permit(:name, :price, :description)
  end
    
end
