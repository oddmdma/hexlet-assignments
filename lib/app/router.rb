# frozen_string_literal: true

require 'rack'

class Router
  def call(env)
    # BEGIN
    request = Rack::Request.new(env)
    path = request.path
    
    if path.start_with?('/admin')
      return [403, { 'Content-Type' => 'text/html' }, ['Forbidden']]
    end
    
    case path
    when '/'
      [200, { 'Content-Type' => 'text/html' }, ['Hello, World! dffd6021bb2bd5b0af676290809ec3a53191dd81c7f70a4b28688a362182986f']]
    when '/about'
      [200, { 'Content-Type' => 'text/html' }, ['About page c10b56512c9dc446d5a5624e9c044a68eddbc9239a3994554943805a8bc38ba7']]
    else
      [404, { 'Content-Type' => 'text/html' }, ['404 Not Found']]
    end
    # END
  end
end 