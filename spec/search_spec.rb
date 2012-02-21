#encoding: utf-8
require 'spec_helper'

describe Search do
  let(:keywords){ ["seo software"] }
  subject{ described_class.new(keywords) }
  
  describe "searching at google" do
    before do
      FakeWeb.register_uri :get, "http://www.google.com/search?q=seo+software&num=100&start=1"  , body: File.read("./spec/seo_software1.html")
      FakeWeb.register_uri :get, "http://www.google.com/search?q=seo+software&num=100&start=101", body: File.read("./spec/seo_software2.html")
      @items = subject.results
    end
    it "should hit the google server and parser the response" do
      @items.size.should == 20
    end
    
    it "should return the parsed items" do
      item = @items.first
      item.title.should == "Free SEO Software | The Best PPC & SEO Management Tool -Traffic ..."
    end
  end
  
end