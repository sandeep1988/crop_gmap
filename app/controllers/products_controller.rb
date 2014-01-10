class ProductsController < ApplicationController
  #require 'zip/zip'
  # GET /products
  # GET /products.json

  def index
    @products = Product.paginate(:page => params[:page], :per_page => 4)
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @products }
    end
  end

  # GET /products/1
  # GET /products/1.json
  def show
    @product = Product.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @product }
    end
  end

  # GET /products/new
  # GET /products/new.json
  def new
    @product = Product.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @product }
    end
  end

  # GET /products/1/edit
  def edit
    @product = Product.find(params[:id])
  end

  # POST /products
  # POST /products.json
  def create 
     @product = current_user.products.create(params[:product])
    if @product.save
    if params[:product][:avatar].blank?
      flash[:notice] = "Successfully created product."
      redirect_to @product
    else
      render :action => "crop"
    end
  else
    render :action => 'new'
  end
end

  # PUT /products/1
  # PUT /products/1.json
  def update
    @product = Product.find(params[:id])
    if @product.update_attributes(params[:product])
    if params[:product][:avatar].blank?
      flash[:notice] = "Successfully updated product."
      redirect_to @product
    else
      render :action => "crop"
    end
  else
    render :action => 'edit'
  end
end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product = Product.find(params[:id])
    @product.destroy

    respond_to do |format|
      format.html { redirect_to products_url }
      format.json { head :no_content }
    end
  end

  def all_users
    @users=User.where(:admin => nil)
  end

  def destroy_user 
      @user_destroy = User.find(params[:format])
      @user_destroy.destroy
      redirect_to :action => "all_users"
  end

  def product_detail 
    @product_id = params[:format]
    @product_detail = Product.where(:id => @product_id)
   end

end
