# frozen_string_literal: true

module Pizzabot
  module Handlers
    # path validation
    class Sort
      # simple sorting points (array)
      def apply(path)
        path.points.sort!
        path
      end
    end
  end
end
