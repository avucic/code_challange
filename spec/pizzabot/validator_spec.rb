# frozen_string_literal: true

describe Pizzabot::Validator do
  it 'should not throw exception if input string is valid' do
    path = Pizzabot::Path.new '5x5 (1, 3) (4, 4)'
    expect { subject.apply(path) }.not_to raise_error
  end

  # TODO: not sure about "business" related to this.
  # plane size is irrelevant (or it is misunderstanding) and can be calculated
  # from given points
  it 'should throw exception if plane is less then largest x or y' do
    path = Pizzabot::Path.new '5x5 (6, 3)'
    expect { subject.apply(path) }.to raise_error(InvalidPlaneSizeError)

    path = Pizzabot::Path.new '5x5 (4, 6)'
    expect { subject.apply(path) }.to raise_error(InvalidPlaneSizeError)
  end
end
