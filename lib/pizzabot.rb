# frozen_string_literal: true

require 'pizzabot/path'
require 'pizzabot/error'
require 'pizzabot/handlers/validator'
require 'pizzabot/handlers/sort'

# The most famous pizza delivery bot :)

# simple reducer to handle path input
module Pizzabot
  module_function

  def use(handler)
    @handlers ||= []
    unless handler.method_defined? :apply
      raise(ArgumentError,
            'Invalid handler object. Handler#apply method is not defined')
    end

    @handlers << handler
  end

  def directions(input)
    path = Path.new(input)
    @handlers.to_a.inject(path) do |acc, handler|
      handler.new.apply(acc)
    end.directions
  end
end

Pizzabot.use(Pizzabot::Handlers::Validator)
Pizzabot.use(Pizzabot::Handlers::Sort)
