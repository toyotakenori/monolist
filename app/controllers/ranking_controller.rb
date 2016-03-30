class RankingController < ApplicationController

def have
    
    @items = Item.all
    @have_numbers = Hash.new
    @top10have_items = Hash.new
    
    # itemsのhave数を取り出して、各itemに対応させたハッシュをつくる。
    @items.each do |item|
      @have_numbers.store(item, item.have_users.count)
    end

    # have数によるソーティング
    @top10have_items = @have_numbers.sort_by{|k, v| -v}

    #have数上位10個のitemを返す
    @top10have_items = @top10have_items[0..9]
    
    #ArrayをActiveRecord_Relationに変換する。
    @top10have_items = Item.where(id: @top10have_items)
    
end

def want
    
    @items = Item.all
    @want_numbers = Hash.new
    @top10want_items = Hash.new
    
    # itemsのwant数を取り出して、各itemに対応させたハッシュをつくる。
    @items.each do |item|
      @want_numbers.store(item, item.want_users.count)
    end

    # want数によるソーティング
    @top10want_items = @want_numbers.sort_by{|k, v| -v}

    #want数上位10個のitemを返す
    @top10want_items = @top10want_items[0..9]
    
    #ArrayをActiveRecord_Relationに変換する。
    @top10want_items = Item.where(id: @top10want_items)
    
end


end
