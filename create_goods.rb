require 'csv'

class Create
    def create_goods(html)
        goods = []
        doc = Nokogiri::HTML(html)
            doc.css(".DrEymJ").each do |item|
            name = item.css("._VhIW9").map { |name| name.text.strip }
            price = item.css(".oRhQRr").map { |price| price.text.strip }
            colors = item.css(".EfZsZh").map { |colors| colors.text.strip }
            size = item.css(".ZIf9_S").map { |size| size.text.strip }
            discounts = item.css("._GEplX").map { |discounts| discounts.text.strip }
            goods.push(
                name: name.first,
                price: price.first,
                colors: colors.first,
                size: size.first,
                discounts: discounts.first
            )
        end
        return goods
    end
end
