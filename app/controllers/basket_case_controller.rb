class BasketCaseController < ApplicationController
  before_action :set_fruits, :set_items, :set_order

  def index; end

  def order_by_fruit
    @list_items = @list_items.sort
    @list_items = @list_items.reverse if params.has_key?(:order) && params[:order] == "desc"
    render 'basket_case/index'
  end

  def order_by_amount
    # code here

    @list_items = @list_items.sort_by {|_name, amount| amount }

    @list_items = @list_items.reverse if params[:order] == "desc"

    render 'basket_case/index'
  end

  private
    def set_fruits
      @fruits = {
        oranges: 5,
        apples: 9,
        grapes: 3,
        watermelons: 2
      }
    end

    def set_items
      @list_items = @fruits
    end

    def set_order
      params[:order] ||= "asc"

      @order = params[:order]

      @new_order = @order == 'asc' ? 'desc' : 'asc'
    end
end
