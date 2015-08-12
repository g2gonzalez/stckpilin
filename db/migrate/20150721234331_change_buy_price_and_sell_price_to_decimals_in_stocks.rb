class ChangeBuyPriceAndSellPriceToDecimalsInStocks < ActiveRecord::Migration
  def change
  	change_column :stocks, :buy_price, :decimal
  	change_column :stocks, :sell_price, :decimal
  end
end
