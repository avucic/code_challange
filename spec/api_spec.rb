# frozen_string_literal: true

OUTER_APP = Rack::Builder.parse_file('config.ru').first

describe 'PizzaBotAPI' do
  include Rack::Test::Methods

  def app
    OUTER_APP
  end

  context 'with valid input' do
    it 'should return valid status' do
      post '/pizzabot', '5x5 (2,3) (1,2)' => nil
      expect(last_response.body).to eq('ENNDEND')
    end
  end

  context 'with invalid input' do
    it 'should return valid status' do
      post '/pizzabot', '5x5 (2,3) (1,' => nil
      expect(last_response.status).to eq(400)
    end
  end
end
