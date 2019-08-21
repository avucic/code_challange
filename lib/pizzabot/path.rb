# frozen_string_literal: true

require 'pizzabot/direction'

module Pizzabot
  # simple object to hold Cartesian plane coordinate
  Point = Struct.new(:x, :y) do
    def to_ary
      [x, y]
    end

    def <=>(another)
      to_ary <=> another.to_ary
    end
  end

  class Path
    PARSE_PATH_REG = /^(\d+x\d+\s)((\(\s?\d+\s?,\s?\d+\s?\)\s?)+)$/.freeze

    attr_writer :points

    def initialize(path)
      @path = path
      _, @dimension, @pairs = path.match(Path::PARSE_PATH_REG).to_a
      @dimension && @pairs || raise(InvalidPathError)
    end

    # convert plane size to point
    def plane
      @plane ||= Point.new(*@dimension.strip.split('x').map(&:to_i))
    end

    # convert coordinates from input string to points
    def points
      @points ||= begin
        @pairs.scan(/\s?\d\s?,\s?\d\s?/).map do |s|
          Point.new(*s.strip.split(',').map(&:to_i))
        end
      end
    end

    # build directions string
    def directions
      @directions ||= begin
        points.map(&:to_a).inject(['', [0, 0]]) do |(s, prev), el|
          [s + Direction.new(prev, el).to_s, el]
        end[0]
      end
    end

    # TODO: reformat/clean path
    def to_s
      @path
    end
  end
end
