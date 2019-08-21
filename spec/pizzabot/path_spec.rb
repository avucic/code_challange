# frozen_string_literal: true

describe Pizzabot::Path do
  context 'with valid input' do
    it 'should parse input string' do
      sample = '5x5 (1, 3) (4, 4)'

      expect(
        Pizzabot::Path.new(sample).points.map(&:to_a)
      ).to match_array [[1, 3], [4, 4]]
      expect(Pizzabot::Path.new(sample).plane.to_a).to match_array [5, 5]
    end

    it 'should not throw exception if path is valid' do
      [
        '5x5 (1, 3) (4, 4)',
        '55x55 (11, 33) (43, 43)'
      ].each do |s|
        expect  do
          Pizzabot::Path.new(s)
        end.to_not raise_error
      end
    end
  end

  context 'with invalid input' do
    it 'should allow single white space between plane and pairs' do
      expect { Pizzabot::Path.new('5x5  (1,0)') }.to raise_error(/Invalid path/)
    end

    it 'should not allow white space between size digits' do
      expect { Pizzabot::Path.new('5 x 5 (1,0)') }.to raise_error(/Invalid path/)
    end

    it 'should throw exception if path is not valid' do
      [
        '()',
        '5x5',
        '5x5 ()',
        '5x (5,4)',
        '5x5 (5,  4)',
        '5x5 (5,)',
        '(5,5)',
        '(5,5) (4,3)',
        '5x5 (1 0) (1'
      ].each do |s|
        expect  do
          Pizzabot::Path.new(s)
        end.to raise_error(/Invalid path/)
      end
    end
  end

  context 'methods' do
    describe '#to_s' do
      it 'should return path' do
        sample = '5x5 (1, 3) (4, 4)'

        expect(Pizzabot::Path.new(sample).to_s).to eq sample
      end
    end

    describe '#directions' do
      it 'should return valid directions string' do
        samples = [
          '5x5 (1, 3) (4, 4)',
          '5x5 (0, 3) (3, 3)',
          '5x5 (0, 0)',
          '5x5 (0, 0) (3,2) (3,1) (3,1)'
        ]

        expectations = %w[
          ENNNDEEEND
          NNNDEEED
          D
          DEEENNDSDD
        ]

        samples.each.with_index do |s, i|
          expect(Pizzabot::Path.new(s).directions).to eq expectations[i]
        end
      end
    end
  end
end
