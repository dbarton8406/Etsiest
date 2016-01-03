# Etsiest
![Image of localhost3000](https://cloud.githubusercontent.com/assets/14100111/11482830/00e2f274-9773-11e5-8923-6ca1f5af43b9.png)

![Image of localhost3000](https://cloud.githubusercontent.com/assets/14100111/11482829/00deffb6-9773-11e5-8584-65c726272a77.png)

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/etsiest`. To experiment with that code, run `bin/console` for an interactive prompt.

Re-Create An Etsy Page
 Start by focusing on having a header, sidebar, and main content area. Then try to style the grid to look as close to the linked etsy page as possible.

The sidebar should be present but its contents can be whatever you like. You don't have to have the various parameters for the search box, etc.
Deliverables


If I run the code with ETSY_KEY=mySecretKey bundle exec ruby lib/etsiest.rb, it should start a sinatra app.

If I go to localhost:4567/search?q=whiskey in my broswer, I should see a page as close to the [etsy search][esty-search] page as possible.

Requirements

There should be just one route for your app. get '/search' would be acceptable.
The controller method should check for a query parameter called "q" and search the Etsy API for matching listings.
Use the API results to render the page! Make it look as close as possible to the equivalent Etsy search page! Start with the layout before focusing on fine details.
Each item should link to its Etsy page.

Hard Mode

Make the search form actually link back to our search page with a new query param. This way you don't have to manually write the URL in the address bar every time. :)

If you do this your controller method shouldn't try to make an API call if no query is provided.

Nightmare Mode

Try to implement hover events for the items as on the Etsy page. (Hover over one of the results on Etsy's site to see what I mean. Yes, this madness is doable with CSS.)


bundle gem etsiest in your folder for projects. This will generate a new project skeleton in an 'etsiest' folder.
Add any needed gems to the Gemfile. For this project, you'll want "sinatra" and "etsy". (You probably also want pry in a :development group. :)
Now commit the basic project skeleton by running git add . and git commit -m 'Basic project skeleton.'!
If you haven't already, create a new repo on github and add the remote / push your copy to github.
Get an API token by registering as an Etsy developer.
Note: Don't forget to run bundle!

Read the docs for the etsy gem, you don't need to write your own API wrapper! Just sticking to "Public Mode" API calls should be fine, you only need an API key not the crazy OAuth stuff.

FAQ

The Etsy Gem docs are confusing. What friggin API call should I be using?

Yeah, the API docs for the Gem are a bit confusing. You have two options:

Etsy::Listing.find_all_active_by_category('whiskey', :includes => ['Images', 'Shop']) but this still returns weird results sometimes.
Etsy::Request.get('/listings/active', :includes => ['Images', 'Shop'], :keywords => 'whiskey') seems to return good results.
Remember: You have to set your API key first!

How do we pass our Etsy API key along?

I would just run this on the command line as follows: ETSY_KEY=foobarbaz bundle exec ruby lib/etsiest.rb

Then in your "etsiest.rb" file, outside your module you can just do:

  require 'etsy'
  Etsy.api_key = ENV['ETSY_KEY']
Where do we put our CSS with Sinatra?

Remember that our erb templates live in a lib/views directory.

Similarly, you may put stylesheets in a lib/public directory.

You can then add it to the <head> of your views as follows: <link rel="stylesheet" href="foo.css">

How do we use partials with Sinatra?

You can do this project without partials (or layouts) but partials will make your life easier when you need to render the search results.

From the Sinatra docs: partials!

Simply add another file foo.erb, place the HTML/ERB you want to be a partial in there. Then call it from the original file as follows:

<%= erb :foo %>

If you want variables to be in scope in the partial, just do:

<%= erb :foo, locals: { var_a: 'cookies', var_b: x } %>

Resources

Learn Layout
Etsy Gem Documentation
Etsy API Documentation
Etsy JSON Response Example
Etsy Page Example

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'etsiest'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install etsiest

## Usage

TODO: Write usage instructions here

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/etsiest. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

