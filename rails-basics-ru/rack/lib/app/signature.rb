# frozen_string_literal: true

require 'digest'

class Signature
  def initialize(app)
    @app = app
  end

  def call(env)
    # BEGIN
    status, headers, body = @app.call(env)

    # Only add signature if there's a body
    if body.any?
      # Get the body content
      body_content = body.join

      # Create a hash of the body content
      signature = Digest::SHA256.hexdigest(body_content)

      # Append the signature to the body
      new_body = body.dup
      new_body << signature

      [status, headers, new_body]
    else
      [status, headers, body]
    end
    # END
  end
end
