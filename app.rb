require 'sinatra'
require 'sassc'

scss = File.open("style/main.scss").readlines.join("\n")

css = SassC::Engine.new(scss, style: :compressed).render

enable :sessions

get '/poems/' do
  files = Dir.glob("public/poems/*.txt")
  poems = []
  for f in files
    poem = {}
    file = File.open(f)
    lines = file.readlines

    poem[:url] = File.basename(f)
    poem[:title] = lines[0]

    poem[:body] = lines.drop(2).join("\n")
    poems.push(poem)
  end
  erb :poems, :locals => {:poems => poems}
end

get '/css/main.css' do
  content_type 'text/css', :charset => 'utf-8'
  css
end
