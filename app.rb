require 'sinatra'

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
