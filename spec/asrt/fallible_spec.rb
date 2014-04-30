require 'asrt'

describe 'Asrt::Fallible#asrt' do
  it 'should fail if no parameter nor block is given' do
    expect{ asrt }.to raise_error(Asrt::AssertionError)
  end

  it 'should fail unless parameter is true' do
    expect{ asrt false }.to raise_error(Asrt::AssertionError)
    expect{ asrt nil }.to raise_error(Asrt::AssertionError)
    expect{ asrt 1 }.to raise_error(Asrt::AssertionError)
    expect{ asrt 'true' }.to raise_error(Asrt::AssertionError)
  end

  it 'should not fail when parameter is true' do
    expect{ asrt true }.to_not raise_error
  end

  it 'should fail when block yields anything but true' do
    expect{ asrt { false } }.to raise_error(Asrt::AssertionError)
    expect{ asrt { nil } }.to raise_error(Asrt::AssertionError)
    expect{ asrt { 1 } }.to raise_error(Asrt::AssertionError)
    expect{ asrt { 'true' } }.to raise_error(Asrt::AssertionError)
    expect{ asrt { raise StandardError } }.to raise_error(Asrt::AssertionError)
  end

  it 'should not fail when block yields true' do
    expect{ asrt { true } }.to_not raise_error
  end

  it 'should fail with the given message, when failing' do
    expect{ asrt false, 'msg' }.to raise_error(Asrt::AssertionError, 'msg')
    expect{ asrt 'msg' do false end }.to raise_error(Asrt::AssertionError, 'msg')
  end

  it 'should complain when too many arguments are given' do
    expect{ asrt 1, 2, 3 }.to raise_error(ArgumentError)
    expect{ asrt 1, 2, 3, 4 }.to raise_error(ArgumentError)
  end

  it 'should have the right associativity' do
    def negate(x)
      not x
    end

    expect{ asrt negate false }.to_not raise_error
    expect{ asrt ! false }.to_not raise_error
    expect{ asrt 1 + 2 == 3 }.to_not raise_error
    expect{ asrt raise StandardError rescue raise StandardError, 'msg' }.to raise_error(StandardError, 'msg')
  end
end
