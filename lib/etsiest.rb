require "etsiest/version"
require "sinatra/base"
require "etsy"
require "json"


    Etsy.api_key = ENV["ETSY_KEY"]

module Etsiest
  class App < Sinatra::Base
    set :logging,true
    set :bind, "0.0.0.0"
    


   get "/" do
    
      results = Etsy::Request.get("/listings/active",
      	:includes => ['Images', 'Shop'], :keywords => 'whiskey', :sort_on => 'score' )
    puts "Results are #{results.result[0].to_json}"
    erb :index, locals: {results: results}
  end

	run! if app_file == $0
  end
end
