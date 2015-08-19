class PriceEarningRatios < ActiveRecord::Base
  ratio_ids = Ratio.find(:all)
  if ratio_ids.size > 0
    Ratio.destroy(ratio_ids)
    puts "#{ratio_ids.size} ratios have been deleted!"
  end

  file_in = 'db/per.csv'
  file = File.open(file_in,"r")

  file.each do |line|
    ary = line.split(",")
    name = ary[0]
    price = ary[1]
    eps = ary[2]
    per = ary[3]
    pbv = ary[4]
    yld = ary[5]
    dividend = ary[6]
	par = ary[7]
	shares = ary[8]
    Ratio.create(:stock_name => name, :price => price, :earning_per_share => eps, :ratio => per, :price_book_value => pbv, :yield => yld, :dividend => dividend, :par_value => par, :shares => shares)
  end

  ratio_ids = Ratio.find(:all)
  ratio_ids.each do |p|
    p.stock = Stock.find_by_name(p.stock_name)
    p.save
  end

  ratio_ids = Ratio.find(:all, :conditions => {:stock_id => nil})
  if ratio_ids.size > 0
    Ratio.destroy(ratio_ids)
    puts "#{ratio_ids.size} ratios have no stock"
  end


end
