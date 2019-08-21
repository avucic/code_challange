# frozen_string_literal: true

describe 'Pizzabot::Direction' do
  it 'should raise exception if point1 or point2 argument is missing' do
    expect { Pizzabot::Direction.new([0, 9], nil) }.to raise_error('Missing point')
    expect { Pizzabot::Direction.new(nil, [0, 9]) }.to raise_error('Missing point')
  end

  it 'should build EAST and NORTH direction string' do
    points = [
      [0, 0],
      [1, 3]
    ]
    expect(Pizzabot::Direction.new(*points).to_s).to eq 'ENNND'
  end

  it 'should build WEST and SOUTH direction string' do
    points = [
      [1, 3],
      [0, 0]
    ]
    expect(Pizzabot::Direction.new(*points).to_s).to eq 'WSSSD'
  end

  it 'should add D for drop when points are the same' do
    expect(Pizzabot::Direction.new([1, 3], [1, 3]).to_s).to eq 'D'
    expect(Pizzabot::Direction.new([0, 0], [0, 0]).to_s).to eq 'D'
  end
end
