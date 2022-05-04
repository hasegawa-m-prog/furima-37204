class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :set_item, only: [:index, :create]

  def index
    set_item
    if current_user.id == @item.user_id
        redirect_to root_path
      elsif Purchase.exists?(item_id: @item.id)
        redirect_to root_path
    end
    @purchase_shipping = PurchasesShipping.new
  end

  def create
    @purchase_shipping = PurchasesShipping.new(purchase_shipping_params)
    if @purchase_shipping.valid?
      pay_item
      @purchase_shipping.save
      redirect_to root_path
    else
      render :index
    end
  end

  
  private
  
    def purchase_shipping_params
      params.require(:purchases_shipping).permit(:postcode, :prefecture_id, :municipality, :address, :building, :phone).merge(user_id: current_user.id, item_id: params[:item_id],token: params[:token] )
    end

    def set_item
      @item = Item.find(params[:item_id])    
    end

    def pay_item
      Payjp.api_key = "sk_test_4f4369fb6940180360f4eaaa"
      Payjp::Charge.create(
        amount: set_item[:price],
        card: purchase_shipping_params[:token],
        currency: 'jpy'
      )
    end
end