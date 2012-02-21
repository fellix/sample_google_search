class KeywordParser
  def initialize filename
    content = File.read filename
    @document = Nokogiri::XML(content)
  end
  
  def keywords
    @document.xpath("//keywords/keyword").map &:text
  end
  
end