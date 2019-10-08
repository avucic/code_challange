# frozen_string_literal: true

dir = File.expand_path('./lib', __dir__)
$LOAD_PATH.unshift(dir)

require 'pizzabot'
require 'grape'
# frozen_string_literal: true

module PizzaBot
  class API < Grape::API
    content_type :txt, 'text/plain'

    post '/pizzabot' do
      input = params.keys.first
      Pizzabot.directions(input)
    rescue InvalidPathError => e
      error! "Invalid path: #{input}. It should be in format, for ex. 5x5 (0,1) (2,3)", 400
    rescue InvalidPlaneSizeError => e
      error! 'Plane dimension is not compatible with given coordinates', 400
    rescue StandardError
      error! e.to_s, 400
    end
   end
end

run PizzaBot::API
