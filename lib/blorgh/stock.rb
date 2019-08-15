module Blorgh
  class Stock
    def initialize()
      @base_url = "http://hq.sinajs.cn/list="
      @stock_list = "sh601298"
      @stock_price = ""
    end

    def get_stock_price
      html  =  RestClient.get("#{@base_url}#{@stock_list}").body
      html = html.encode('utf-8', 'gb2312')
      lines = html.split("\n")
      lines.each do |line|
        stockInfo = line.split(',')
        temp  = stockInfo[0].split('_')[2].gsub('"','').split('=')
        code, name = temp[0], temp[1]
        currentPrice = Float(stockInfo[3])
        @stock_price = "#{@stock_price},#{currentPrice}"
      end
      @stock_price
    end

  end
end

# while true do
#   system "clear"
#   GetStock.new()
#   sleep(1)
# end
