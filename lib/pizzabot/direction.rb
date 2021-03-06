# frozen_string_literal: true

module Pizzabot
  # convert points to direction string by comparing prev and next point
  class Direction
    def initialize(point1, point2)
      @p1 = point1
      @p2 = point2
      @p1 && @p2 || raise(ArgumentError, 'Missing point')
    end

    # if points are the same it will print D. Otherwise will build direction string
    def to_s
      drop? ? 'D' : build
    end

    private

    # check if the points are equal
    def drop?
      @p1.to_s == @p2.to_s
    end

    def build
      x1, y1, x2, y2 = @p1 + @p2

      # diff between prev and next x and y values
      xdiff = x1 - x2
      ydiff = y1 - y2

      # assign directions based on the diff between x,y values
      hd = xdiff < 0 ? 'E' : 'W'
      vd = ydiff < 0 ? 'N' : 'S'

      # start with "next" element to skip duplication
      hs = (1..xdiff.abs).reduce('') { |s| s + hd }
      vs = (1..ydiff.abs).reduce('') { |s| s + vd }

      # join string using horizontal and then vertical results.
      # append D at the end for drop on location
      hs + vs + 'D'
    end
  end
end
