#encoding: utf-8
require './lib/google/item'
require 'nokogiri'

describe Google::Item do
  let(:element_html){ '<li class="g"><div class="vsc" pved="0CHsQkgowAA" sig="1dY" rawurl="http://www.apple.com/br/ipad/"><h3 class="r"><a href="/url?sa=t&amp;rct=j&amp;q=ipad&amp;source=web&amp;cd=1&amp;ved=0CH4QFjAA&amp;url=http%3A%2F%2Fwww.apple.com%2Fbr%2Fipad%2F&amp;ei=q9BDT-fIK8jf0QHVnMS_Bw&amp;usg=AFQjCNHHhLTznZMVfYNOVvvBOFqBtaNzFw" class="l" onmousedown="return rwt(this,\'\',\'\',\'\',\'1\',\'AFQjCNHHhLTznZMVfYNOVvvBOFqBtaNzFw\',\'\',\'0CH4QFjAA\',null,event)">Apple - <em>iPad</em> 2 - Design avançado. Chamadas com vídeo. E mais.</a></h3><div class="vspib" aria-label="Detalhes do resultado" role="button" tabindex="0"><div class="vspii"><div class="vspiic"></div></div></div><div class="s"><div class="f kv"><cite>www.apple.com/br/<b>ipad</b>/</cite><span class="vshid"><a href="http://webcache.googleusercontent.com/search?q=cache:Whs6-LMxrb0J:www.apple.com/br/ipad/+ipad&amp;cd=1&amp;hl=pt-BR&amp;ct=clnk&amp;gl=br" onmousedown="return rwt(this,\'\',\'\',\'\',\'1\',\'AFQjCNHAF9Yqx9m1LCAbyqtmkcKpQ7tvJw\',\'\',\'0CIUBECAwAA\',null,event)">Em&nbsp;cache</a>&nbsp;-&nbsp;<a href="/search?hl=pt-BR&amp;biw=1531&amp;bih=819&amp;q=related:www.apple.com/br/ipad/+ipad&amp;tbo=1&amp;sa=X&amp;ei=q9BDT-fIK8jf0QHVnMS_Bw&amp;ved=0CIYBEB8wAA">Similares</a></span><button class="gbil esw eswd eswh" onclick="window.gbar&amp;&amp;gbar.pw&amp;&amp;gbar.pw.clk(this)" onmouseover="window.gbar&amp;&amp;gbar.pw&amp;&amp;gbar.pw.hvr(this,google.time())" g:entity="http://www.apple.com/br/ipad/" g:undo="poS0" title="Recomendar esta página" g:pingback="/gen_204?atyp=i&amp;ct=plusone&amp;cad=S0" style=""></button></div><div class="esc slp" id="poS0" style="display:none">Você marcou isto com +1 publicamente.&nbsp;<a href="#" class="fl">Desfazer</a></div><span class="st">Design fino e leve. Chip A5 mais rápido. Chamada com vídeo via FaceTime. Bateria com 10 horas de duração. Não é um tablet, é o <em>iPad</em> 2.<br></span><div class="osl osi"><a href="http://www.apple.com/br/ipad/features/" onmousedown="return rwt(this,\'\',\'\',\'\',\'1\',\'AFQjCNGgXTmhR4WHU_CY4Akkh6Bu-KhU8Q\',\'\',\'0CH8Q0gIoADAA\',null,event)">Características</a> - <a href="http://www.apple.com/br/ipad/3g/" onmousedown="return rwt(this,\'\',\'\',\'\',\'1\',\'AFQjCNE4CPweL7sMSsUV3rE5gN4zmrOsVw\',\'\',\'0CIABENICKAEwAA\',null,event)">iPad com Wi-Fi + 3G</a> - <a href="http://store.apple.com/br/browse/home/shop_ipad/family/ipad" onmousedown="return rwt(this,\'\',\'\',\'\',\'1\',\'AFQjCNGQov4gDuaK7rAeCcEVFRCznyrwBA\',\'\',\'0CIEBENICKAIwAA\',null,event)">Comprar iPad 2 agora</a> - <a href="http://www.apple.com/br/" onmousedown="return rwt(this,\'\',\'\',\'\',\'1\',\'AFQjCNG9Yhg7C38oRaHGkaDcHNHc8uH70g\',\'\',\'0CIIBENICKAMwAA\',null,event)">Apple Brasil</a></div></div></div><!--n--></li>' }
  let(:document){ Nokogiri::HTML(element_html) }
  subject{ described_class.new(document, 1, "seo software") }
  
  it "should parse the title" do
    subject.title.should == "Apple - iPad 2 - Design avançado. Chamadas com vídeo. E mais."
  end
  
  it "should parse the url" do
    subject.url.should == "www.apple.com/br/ipad/"
  end
  
  it "should parse the description" do
    subject.description.should == "Design fino e leve. Chip A5 mais rápido. Chamada com vídeo via FaceTime. Bateria com 10 horas de duração. Não é um tablet, é o iPad 2."
  end
  
  it "should return the position" do
    subject.position.should == 1
  end
  
  it "should has the position + title as string" do
    subject.to_s.should == "1 - Apple - iPad 2 - Design avançado. Chamadas com vídeo. E mais."
  end
  
end