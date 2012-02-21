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
      @document.css("div.s div.kv cite").text
    end
    
    def description
      @document.css("div.s span.st").text
    end
    
    def to_s
      "#{position} - #{title}"
    end
  end
end