# frozen_string_literal: true

describe Pizzabot::Sort do
  it 'should sort points' do
    path = Pizzabot::Path.new '5x5 (1, 3) (4, 4) (0, 2)'

    # before mutation
    expect(
      path.points.map(&:to_a)
    ).to match_array([[1, 3], [4, 4], [0, 2]])

    # after mutation
    expect(
      subject.apply(path).points.map(&:to_a)
    ).to match_array([[0, 2], [1, 3], [4, 4]])
  end
end
