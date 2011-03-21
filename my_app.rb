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

GOALS:
%ul
  %li
    Run a marathon pain free and in SHAPE
  %li
    Be financially stable
  %li
    Strength and skill


@@ page

%h1= @page

= @page.to_html


