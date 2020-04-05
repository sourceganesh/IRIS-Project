class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except:[:show, :index]
  # GET /items
  # GET /items.json
  def index
    @items = Item.all
  end

  def useritem
    @items = Item.where(:user_id => current_user.id)
  end
  # GET /items/1
  # GET /items/1.json
  def show
    if(@item.deadline <= Time.now)
      @item.active = false
      @item.save
    end
  end

  # GET /items/new
  def new
    @item = Item.new
  end

  # GET /items/1/edit
  def edit
  end

  def bid
    @item = Item.find(params[:id])
    if(@item.deadline <= Time.now)
      @item.active = false
      @item.save
    end
  end

  # POST /items
  # POST /items.json
  def create
    @item = Item.new(item_params)
    @item.user_id = current_user.id
    respond_to do |format|
      if @item.save
        format.html { redirect_to @item, notice: 'Item was successfully created.' }
        format.json { render :show, status: :created, location: @item }
      else
        format.html { render :new }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /items/1
  # PATCH/PUT /items/1.json
  def update
    respond_to do |format|
      if(@item.user_id==current_user.id)
      if @item.update(item_params)
        format.html { redirect_to @item, notice: 'Item was successfully updated.' }
        format.json { render :show, status: :ok, location: @item }
      else
        format.html { render :edit }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    else
      format.html { redirect_to @item, notice: 'You cannot edit this item' }
    end
    end
  end

  def bidupdate
    @item = Item.find(params[:id])
    respond_to do |format|
      if(@item.user_id==current_user.id)
          format.html { redirect_to @item, notice: 'You cannot Bid on this item' }
          format.json { render :show, status: :ok, location: @item }
      else
        if @item.update(item_params)
          @item.bid_id = current_user.id
          @item.save
          format.html { redirect_to @item, notice: 'Your bid is successfully placed.' }
          format.json { render :show, status: :ok, location: @item }
        else
          format.html { render :edit }
          format.json { render json: @item.errors, status: :unprocessable_entity }
        end
      end
  end
end
  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    @item.destroy
    if(@item.user_id==current_user.id)
    respond_to do |format|
      format.html { redirect_to items_url, notice: 'Item was successfully destroyed.' }
      format.json { head :no_content }
    end
    else
      format.html { redirect_to @item, notice: 'You cannot destroy this item' }
  end

  def claim
    @item = Item.find(params[:id])
    @item.claim = true
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def item_params
      params.require(:item).permit(:title, :description, :bid, :deadline, :contact, :image)
    end
end
