# frozen_string_literal: true

describe Pizzabot do
  describe '#directions' do
    let(:sample) { '5x5 (1,3) (2,4)' }

    around(:each) do |example|
      old = Pizzabot.instance_variable_get(:@handlers)
      Pizzabot.instance_variable_set(:@handlers, [])
      example.run
      Pizzabot.instance_variable_set(:@handlers, old)
    end

    it 'should return string if there are no handlers' do
      expect(Pizzabot.directions(sample)).not_to be_empty
    end

    it 'should apply handlers to the input' do
      Handler1 = Class.new do
        def apply(input)
          input
        end
      end

      Handler2 = Class.new do
        def apply(input)
          input
        end
      end

      Pizzabot.use(Handler1)
      Pizzabot.use(Handler2)

      expect_any_instance_of(Handler1).to receive(:apply).and_call_original
      expect_any_instance_of(Handler2).to receive(:apply).and_call_original

      Pizzabot.directions(sample)
    end
  end

  describe 'Output' do
    context 'with valid cases' do
      it 'should solve challenge case' do
        sample = '5x5 (0, 0) (1, 3) (4,4) (4, 2) (4, 2) (0, 1) (3, 2) (2, 3) (4, 1)'
        expect(Pizzabot.directions(sample)).to eq(
          'DNDENNDEDESDESDNDDNND'
        )
      end

      it 'should add D for zero point drop' do
        sample = '5x5 (0, 0)'
        expect(Pizzabot.directions(sample)).to eq(
          'D'
        )
      end

      it 'should add D for multiple zero points' do
        sample = '5x5 (0, 0) (0,0)'
        expect(Pizzabot.directions(sample)).to eq('DD')
      end

      it 'should add D for multiple equal points' do
        sample = '5x5 (1, 0) (1,0)'
        expect(Pizzabot.directions(sample)).to eq('EDD')
      end

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
          DEEENDDND
        ]

        samples.each.with_index do |s, i|
          expect(Pizzabot.directions(s)).to eq expectations[i]
        end
      end
    end

    context 'with invalid cases' do
      it 'should throw error for invalid input' do
        sample = '5x5 (1, 0) (1'
        expect { Pizzabot.directions(sample) }.to raise_error(/Invalid path/)
      end
    end
  end
end
