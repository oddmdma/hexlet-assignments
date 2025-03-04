# frozen_string_literal: true

class AdminPolicy
  def initialize(app)
    @app = app
  end

  def call(env)
    # BEGIN
    request = Rack::Request.new(env)
    path = request.path
    
    if path.start_with?('/admin')
      return [403, { 'Content-Type' => 'text/html' }, []]
    end
    
    @app.call(env)
    # END
  end
end