# frozen_string_literal: true

class InvalidPathError < StandardError
  def initialize(msg = 'Invalid path')
    super
  end
end

class InvalidPlaneSizeError < StandardError
  def initialize(msg = 'Invalid plane.')
    super
  end
end
