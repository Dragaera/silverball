# coding_ utf-8

require 'spec_helper'

module Silverball
  RSpec.describe Numbers do
    subject do
      s = Class.new
      s.extend Numbers
      s
    end

    describe '::number_with_separator' do
      it 'should handle numbers with less than four digits' do
        expect(subject.number_with_separator(123)).to eq '123'
      end

      it 'should handle numbers with four digits' do
        expect(subject.number_with_separator(1234)).to eq "1'234"
      end

      it 'should handle numbers which split into pairs of three digits' do
        expect(subject.number_with_separator(123456)).to eq "123'456"
        expect(subject.number_with_separator(426347234)).to eq "426'347'234"
      end

      it 'should handle numbers with surplus digits' do
        expect(subject.number_with_separator(1234567)).to eq "1'234'567"
        expect(subject.number_with_separator(29257128453)).to eq "29'257'128'453"
      end

      it 'should handle a custom separator' do
        expect(subject.number_with_separator(123456, '.')).to eq '123.456'
      end
    end

    describe 'fraction_as_percentage' do
      it 'should return a well-formatted percentage' do
        expect(subject.fraction_as_percentage(23, 100)).to eq '23.0%'
        expect(subject.fraction_as_percentage(3, 9)).to eq '33.3%'
      end

      it 'should support varying accuriacies' do
        expect(subject.fraction_as_percentage(3, 9, 3)).to eq '33.333%'
      end
    end
  end
end
