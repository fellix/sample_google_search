module Google
  class Item
    attr_accessor :position, :keyword
    def initialize item_document, position, keyword
      @document = item_document
      @position = position
      @keyword = keyword
    end
    
    def title
      @document.css("h3.r a").text
    end
    
    def url
      uri = Addressable::URI.parse(@document.css("h3.r a").first['href'])
      uri.query_values["q"]
    end
    
    def description
      @document.css("div.s").text
    end
    
    def to_s
      "#{position} - #{title}"
    end
    
    def to_search_item
      SearchItem.new title: title, url: url, description: description, position: position, keyword: keyword
    end
  end
end