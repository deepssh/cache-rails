class ProductsController < ApplicationController
  def index
    #regular products
    @products = Product.all

    # products cached at the model
    @model_products = Product.all_cached
  end

  def show
    @product = Product.find(params[:id])
    # if stale?(last_modified: @product.updated_at.utc, etag: @product.cache_key)
    # the above line can replaced by below line
    if stale?(@product)
      respond_to do |format|
        format.html
      end
    end
    # or a complete alternative would just this one line
    # fresh_when @product
    # It also accepts :last_modified and :etag options, just like stale?.
  end 
end
