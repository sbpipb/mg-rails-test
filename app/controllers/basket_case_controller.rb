class BasketCaseController < ApplicationController
  before_action :set_fruits
  before_action :set_items

  def index; end

  def order_by_fruit
    @list_items = @list_items.sort
    render 'basket_case/index'
  end

  def order_by_amount
    # code here
    @list_items = @list_items.sort_by { |_name, value| value }

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
end
