# frozen_string_literal: true

class ExecutionTimer
  def initialize(app)
    @app = app
  end

  def call(env)
    # Record the start time in microseconds
    start_time = Time.now

    # Call the next middleware in the chain
    status, headers, body = @app.call(env)

    # Calculate the execution time in microseconds
    end_time = Time.now
    execution_time = ((end_time - start_time) * 1_000_000).to_i

    # Create a new body with the execution time information
    # We need to preserve the original body for the hash calculation
    new_body = body.dup
    new_body.unshift("Execution time: #{execution_time} μs\n")

    [status, headers, new_body]
  end
end
