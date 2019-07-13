class SalesController < ApplicationController
  def new

  end

  def done
    @sales = Sale.all
  end

  def create
    @sale = Sale.new(sale_params)

    @sale.total = @sale.value - (@sale.value * @sale.discount / 100)
    if @sale.tax != 1
       @sale.tax = 1.19
     end

  @sale.total = @sale.total * @sale.tax

    @sale.save
    redirect_to sales_done_path
  end

  private
  def sale_params
    params.require(:sale).permit(:cod, :detail, :category, :value, :discount, :tax)
  end
end
