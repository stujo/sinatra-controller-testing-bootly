
get '/' do
  <<-eos
  <html>
  <body>
  <h1>bootly</h1>
  <a id="link_urls" href="/urls">URLS</a>
  <form id="form_add" action="/urls" method="post">
  <input name="full_url"/>
      <input id="submit_add" type="submit"/>
  </form>
  </body>
  </html>
  eos
end

get '/error' do
  raise "PROBLEM!!!"
end

get '/teams' do
  redirect '/about'
end

get '/urls' do
  @urls = Url.all
  erb :urls
end

post '/urls' do
  Url.create(full_url: params['full_url'])
  redirect '/urls'
end
