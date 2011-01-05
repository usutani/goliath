#!/usr/bin/env ruby

require 'rubygems'
require 'goliath'

class Echo < Goliath::API
  def middleware
    use Goliath::Rack::Params

    use Goliath::Rack::DefaultMimeType

    use Goliath::Rack::Formatters::JSON

    use Goliath::Rack::Render
    use Goliath::Rack::Heartbeat
    use Goliath::Rack::ValidationError

    use Goliath::Rack::Validation::RequestMethod, %w(GET)

    use Goliath::Rack::Validation::RequiredParam, {:key => 'echo'}
  end

  def response(env)
    [200, {}, {:response => env.params['echo']}]
  end
end
