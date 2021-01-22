# frozen_string_literal: true

require_relative 'fixtures/extension'

RSpec.describe RefineExport do
  it 'does not interfere with refinement' do
    require_relative 'fixtures/using'
    expect($RESULT).to eq %w[foofoo foofoofoo]
  end

  def test(obj)
    [
      (obj.twice rescue :err),
      (obj.thrice rescue :err),
    ]
  end

  it 'exports all the methods defined up to that point' do
    obj = Class.new(Array) { include Extension }.new << :x
    expect(test(obj)).to eq [%i[x x], :err]
    obj = Class.new(Array) { include OtherExt }.new << :y
    expect(test(obj)).to eq [%i[y y], %i[y y y]]
  end

  it 'handles private methods' do
    obj = Class.new(Array) { include OtherExt }.new << :y
    expect(obj.__send__(:foo)).to eq 42
    expect { obj.foo }.to raise_error(NoMethodError)
  end
end
