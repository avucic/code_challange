# frozen_string_literal: true

module Pizzabot
  # path validation
  class Validator
    # TODO: not sure about "business" related to given size.
    # plane size can be figure out from given points
    def apply(path)
      lx, ly = path.points.last
      px, py = path.plane.to_a

      raise InvalidPlaneSizeError if lx > px || ly > py

      path
    end
  end
end
