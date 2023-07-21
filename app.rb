require 'sinatra'
require 'sassc'

scss = File.open("style/main.scss").readlines.join("\n")

css = SassC::Engine.new(scss, style: :compressed).render

enable :sessions

get '/poems/:name?' do
  files = Dir.glob("public/poems/*.txt")
  poems = []
  for f in files
    poem = {}
    file = File.open(f)
    lines = file.readlines

    poem[:url] = File.basename(f)
    poem[:title] = lines[0]
    if params['name'] != nil
      poem[:open] = (params['name'].downcase == poem[:title].downcase.strip)
    else
      poem[:open] = false
    end

    poem[:body] = "<a href='/poems/#{poem[:title]}'> Share </a><br><pre>" + lines.drop(2).join() + "</pre>"

    poems.push(erb :block, :locals => {
                     :title => poem[:title],
                     :open => poem[:open],
                     :body => poem[:body]
                   })
  end
  erb :poems, :locals => {:poems => poems}
end

get '/fursonas/:fname?' do
  files = Dir.glob("fursonas/*")
  blocks = []
  for f in files
    fursona = {}
    file = File.open(f)
    lines = file.readlines

    name = File.basename(f, ".html")
    open = (params['fname'] == name)
    if params['fname'] == name
      open = true
    else
      open = false
    end

    body = lines.join("\n")
    blocks.push(erb :block, :locals => {:title => name, :open => open, :body => body})
  end
  erb :fursona, :locals => {:fursonas => blocks}
end

get '/css/main.css' do
  content_type 'text/css', :charset => 'utf-8'
  css
end
