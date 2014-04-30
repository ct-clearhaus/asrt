require 'asrt'

describe 'Asrt::Infallible#asrt' do
  include Asrt::Infallible

  it 'should not fail' do
    expect{
      asrt
      asrt true
      asrt false
      asrt false, 'message'
      asrt 'message' do false end
      asrt 'message' do raise StandardError end
    }.to_not raise_error
  end

  it 'should complain when too many arguments are given' do
    expect{ asrt 1, 2 do 3 end }.to raise_error(ArgumentError)
    expect{ asrt 1, 2, 3 }.to raise_error(ArgumentError)
    expect{ asrt 1, 2, 3, 4 }.to raise_error(ArgumentError)
  end
end

