class ItemsController < ApplicationController
  def index
    @items = Item.all
    @item = Item.new
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
     @item = Item.find(params[:id])
  end

  def update
    if @item.update(book_params)
      redirect_to item_path(@item.id), notice: 'successfully'
    else
      render action: :edit
    end
  end
end
