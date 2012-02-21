#encoding: utf-8
require './lib/google/item'
require 'nokogiri'
require "addressable/uri"

describe Google::Item do
  let(:element_html){ "<li class=\"g\">\n<h3 class=\"r\"><a href=\"/url?q=http://lytico.com/&amp;sa=U&amp;ei=c_9DT4uRKuXL0QGytdzEBw&amp;ved=0CJoCEBYwYzgB&amp;usg=AFQjCNGi_6NhI7ZWi-CM5CNRiJU2GmuOuQ\">web analytics, search engine optimization tools, <b>SEO</b> tools</a></h3>\n<div class=\"s\">Lytico makes complex <b>SEO</b> features easy for everyone to understand. Increase <br>  website traffic with Advanced Segmentation, Custom Reporting, Motion Charts, <b>...</b><br><div>\n<cite>lytico.com/</cite><span class=\"flc\"> - <a href=\"//webcache.googleusercontent.com/search?num=100&amp;hl=en&amp;q=cache:8wB6ApQ5LBQJ:http://lytico.com/+seo+software&amp;ct=clnk\">Cached</a> - <a href=\"/search?num=100&amp;hl=en&amp;tbo=1&amp;q=related:http://lytico.com/+seo+software&amp;sa=X\">Similar</a></span>\n</div>\n</div>\n</li>" }
  let(:document){ Nokogiri::HTML(element_html) }
  subject{ described_class.new(document, 1, "seo software") }
  
  it "should parse the title" do
    subject.title.should == "web analytics, search engine optimization tools, SEO tools"
  end
  
  it "should parse the url" do
    subject.url.should == "http://lytico.com/"
  end
  
  it "should parse the description" do
    subject.description.should == "Lytico makes complex SEO features easy for everyone to understand. Increase   website traffic with Advanced Segmentation, Custom Reporting, Motion Charts, ...\nlytico.com/ - Cached - Similar\n\n"
  end
  
  it "should return the position" do
    subject.position.should == 1
  end
  
  it "should has the position + title as string" do
    subject.to_s.should == "1 - web analytics, search engine optimization tools, SEO tools"
  end
  
end