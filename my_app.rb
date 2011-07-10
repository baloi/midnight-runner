%w( rubygems sinatra jadof haml ).each {|lib| require lib}
include JADOF

configure :production do

end

get '/' do
  @pages = Page.all
  
  #@pages.first.body
  haml :pages
end

#get '/:page' do
get '/*' do
  @page = Page.get params[:splat].first
  haml :page
end

enable :inline_templates
__END__

@@ pages

%ul
  - for page in @pages
    %li
      %a{ :href => "/#{ page.to_param }" }= page

%center
  GOALS:
  %table
    %tr
      %td
        %ul
          %li
            Build my empire
          %li
            Run a marathon pain free and in SHAPE
          %li
            Be financially stable
          %li
            Strength and skill
          %li
            Train and nurture the kids

@@ page

<script type="text/javascript">

  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', 'UA-24466734-1']);
  _gaq.push(['_trackPageview']);

  (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();

</script>

%h1= @page

= @page.to_html


