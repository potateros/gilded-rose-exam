class GildedRose

  def initialize(items)
    @items = items
  end

  def quality_limit(quality)
    if quality < 0
      return 0
    elsif quality > 50
      quality = 50
    else
      return quality
    end
  end

  def update_quality
    @items.each do |item|

      case item.name
      when "Aged Brie"
        item.quality = item.quality + 1
        item.sell_in = item.sell_in - 1
        item.quality = quality_limit(item.quality)

      when "Backstage passes to a TAFKAL80ETC concert"
        item.quality = item.quality + 1
        # reversed for easier thought process = sell_in date decreasing, not increasing
        case item.sell_in
        when 6..10
          item.quality = item.quality + 1
        when 1..5
          item.quality = item.quality + 2
        end
        item.sell_in = item.sell_in - 1
        if item.sell_in < 0
          item.quality = 0
        end
        item.quality = quality_limit(item.quality)

      when "Sulfuras, Hand of Ragnaros"
        item.quality = item.quality
        item.sell_in = item.sell_in

      when "Conjured"
        item.quality = item.quality - 2
        item.sell_in = item.sell_in - 1
        if item.sell_in < 0
          item.quality = item.quality - 2
        end
        item.quality = quality_limit(item.quality)

      else
        item.quality = item.quality - 1
        item.sell_in = item.sell_in - 1
        if item.sell_in < 0
          item.quality = item.quality - 1
        end
        item.quality = quality_limit(item.quality)

      end
    end
  end
end
