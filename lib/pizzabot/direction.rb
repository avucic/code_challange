# frozen_string_literal: true

module Pizzabot
  # convert points to direction string by comparing prev and next point
  class Direction
    def initialize(point1, point2)
      @p1 = point1
      @p2 = point2
      @p1 && @p2 || raise(ArgumentError, 'Missing point')
    end

    # if points are the same id will print D. Otherwise will build direction string
    def to_s
      drop? ? 'D' : build
    end

    private

    # check if the points are equal
    def drop?
      @p1.join('') == @p2.join('')
    end

    def build
      x1 = @p1[0]
      x2 = @p2[0]
      y1 = @p1[1]
      y2 = @p2[1]

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
