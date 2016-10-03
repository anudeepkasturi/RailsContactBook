require 'addressable/uri'
require 'rest-client'

def index_users
  url = Addressable::URI.new(
    scheme: 'http',
    host: 'localhost',
    port: 3000,
    path: '/users.html'
  ).to_s

  puts RestClient.get(url)
end

#index_users
def something
  url = Addressable::URI.new(
    scheme: 'http',
    host: 'localhost',
    port: 3000,
    path: '/users/1.json',
    query_values: {
      'some_category[a_key]' => 'another value',
      'some_category[a_second_key]' => 'yet another value',
      'some_category[inner_inner_hash][key]' => 'value',
      'something_else' => 'aaahhhhh'
    }
  ).to_s
end
# something

# def create_user(name, email = nil)
#   url = Addressable::URI.new(
#     scheme: 'http',
#     host: 'localhost',
#     port: 3000,
#     path: '/users.json'
#   ).to_s
#
#   puts RestClient.post(
#     url,
#     { user: { name: name, email: email } }
#   )
# end
#
# begin
#   create_user("Ish")
# rescue RestClient::Exception
#   puts "something went wrong"
# end

def show_user(id)
  url = Addressable::URI.new(
      scheme: 'http',
      host: 'localhost',
      port: 3000,
      path: "/users/#{id}.json"
    ).to_s

    puts RestClient.get(
      url,
      {id: id}
    )
end


begin
  show_user(1)
rescue RestClient::Exception
  puts "something went wrong"
end
