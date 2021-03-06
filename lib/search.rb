require 'open-uri'
require 'uri'
class Search
  GOOGLE_URL = "http://www.google.com/search"
  RESULTS_PER_PAGE = 100
  
  def initialize keywords=[]
    @keywords = keywords
  end
  
  def results
    items = []
    @keywords.each do |keyword|
      keyword_items = []
      2.times { |page| keyword_items.concat(google_search keyword, page+1, keyword_items.size) }
      items.concat keyword_items
    end
    items
  end
  
  private
  def google_search keyword, page=1, offset
    document = Nokogiri::HTML open request_url({q: keyword, page: page})
    items = []
    document.css("li.g").each_with_index do |doc, i|
      position = i+1+offset
      items << Google::Item.new(doc, position, keyword) 
    end
    items
  end
  
  def request_url params={}
    raise InvalidQuery unless params[:q]
    params = validate_params params
    search_term = convert_query_to_search_term(params[:q])
    query = "?q=#{search_term}"
    params.each do |param, value|
      next if param == :q || param == :page
      query += "&#{param}=#{value}"
    end
    "#{GOOGLE_URL}#{query}"
  end
  
  def validate_params params
    params.merge!(num: RESULTS_PER_PAGE)
    page = params[:page] || 1
    params.merge!(start: page == 1 ? 1 : (RESULTS_PER_PAGE+page-1))
    params
  end
  
  def convert_query_to_search_term query
    URI.encode query
  end
  
  class InvalidQuery < StandardError; end
end