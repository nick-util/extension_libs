require 'rails_helper'

describe Hash do
  subject(:hash) do
    { 'aA  ' => 2, b: '  tesT', '   Abc' => { 'aa1   ' => '  test' } }
  end

  describe '#to_lowercase' do
    it 'is expected to lowercase all of the keys' do
      expect(hash.to_lowercase)
        .to eq('aa  ' => 2, :b => '  tesT', '   abc' => { 'aa1   ' => '  test' })
    end
  end

  describe '#to_uppercase' do
    it 'is expected to uppercase all of the keys' do
      expect(hash.to_uppercase)
        .to eq('AA  ' => 2, B: '  tesT', '   ABC' => { 'AA1   ' => '  test' })
    end
  end

  describe '#deep_strip_keys' do
    it 'is expected to strip whitespace surrounding all of the KEYS' do
      expect(hash.deep_strip_keys)
        .to eq('aA' => 2, b: '  tesT', 'Abc' => { 'aa1' => '  test' })
    end
  end

  describe '#deep_strip_values' do
    it 'is expected to to strip whitespace surrounding all of the VALUES' do
      expect(hash.deep_strip_values)
        .to eq('aA  ' => 2, b: 'tesT', '   Abc' => { 'aa1   ' => 'test' })
    end
  end

  describe '#deep_uppercase_values' do
    it 'is expected to uppercase all of the VALUES' do
      expect(hash.deep_uppercase_values)
        .to eq('aA  ' => 2, b: '  TEST', '   Abc' => { 'aa1   ' => '  TEST' })
    end
  end

  describe '#deep_lowercase_values' do
    it 'is expected to lowercase all of the KEYS' do
      expect(hash.deep_lowercase_values)
        .to eq('aA  ' => 2, :b => '  test', '   Abc' => { 'aa1   ' => '  test' })
    end
  end

  describe '#flatten_leaves' do
    it 'is expected to remove the structure by converting the hash to
      k:v pairs with no branches' do
      expect(hash.flatten_leaves)
        .to eq('aA  ' => 2, b: '  tesT', 'aa1   ' => '  test')
    end
  end

  describe '#normalized' do
    it 'is expected to deep_strip, symbolize and lowercase the keys, and lowercase
      the values' do
      expect(hash.normalized)
        .to eq('aa' => 2, b: 'tesT', 'abc' => { 'aa1' => 'test' })
    end
  end

  describe '#normalized_flattened' do
    it 'is expected to deep_strip, symbolize and lowercase the keys, and lowercase
      the values, and remove all structure by putting leaves in a linear hash' do
      expect(hash.normalized_flattened)
        .to eq('aa' => 2, b: 'tesT', 'aa1' => 'test')
    end
  end
end
