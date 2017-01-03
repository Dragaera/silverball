# coding_ utf-8

require 'spec_helper'

module Silverball
  RSpec.describe DateTime do
    subject do
      s = Class.new
      s.extend DateTime
      s
    end

    describe '::timespan_in_words' do
      it 'should handle a timespan of 0 seconds' do
        expect(subject.timespan_in_words(0)).to eq '0s'
      end

      it 'should handle sub-minute timespans' do
        expect(subject.timespan_in_words(45)).to eq '45s'
      end

      it 'should handle timespans equal to one minute' do
        expect(subject.timespan_in_words(60)).to eq '1m'
      end

      it 'should handle timespans above one minute' do
        expect(subject.timespan_in_words(145)).to eq '2m 25s'
      end

      it 'should handle timespans equal to one hour' do
        expect(subject.timespan_in_words(2 * 60 * 60)).to eq '2h'
      end

      it 'should handle timespans above one hour' do
        expect(subject.timespan_in_words(4 * 60 * 60 + 4 * 60 + 4)).to eq '4h 4m 4s'
      end

      it 'should handle timespans above or equal to one day' do
        expect(subject.timespan_in_words(3 * 24 * 60 * 60 + 2 * 60 * 60 + 20)).to eq '3d 2h 20s'
      end
    end

  end
end

