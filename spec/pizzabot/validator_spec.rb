# frozen_string_literal: true

describe Pizzabot::Validator do
  it 'should not throw exception if there input is valid' do
    path = Pizzabot::Path.new '5x5 (1, 3) (4, 4)'
    expect { subject.apply(path) }.not_to raise_error
  end

  # TODO: not sure about "business" related to this. My logic is that I can figure out plane
  # from given points
  it 'should throw exception if plane is less then largest x' do
    path = Pizzabot::Path.new '5x5 (6, 3)'

    expect { subject.apply(path) }.to raise_error(InvalidPlaneSizeError)
  end
end
