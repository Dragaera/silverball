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
      context 'with full output' do
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

      context 'with single-type output' do
        it 'should support seconds only' do
          expect(subject.timespan_in_words(240, unit: :seconds)).to eq '240s'
        end

        it 'should support minutes only' do
          expect(subject.timespan_in_words(270, unit: :minutes)).to eq '4.5m'
        end

        it 'should support hours only' do
          expect(subject.timespan_in_words(3 * 60 * 60 + 6 * 60, unit: :hours)).to eq '3.1h'
        end

        it 'should support days only' do
          expect(subject.timespan_in_words(7 * 24 * 60 * 60 + 12 * 60 * 60, unit: :days)).to eq '7.5d'
        end

        it 'should support sub-unit timespans' do
          expect(subject.timespan_in_words(0.5,          unit: :seconds, round: 1)).to eq '0.5s'
          expect(subject.timespan_in_words(30,           unit: :minutes, round: 1)).to eq '0.5m'
          expect(subject.timespan_in_words(30 * 60,      unit: :hours,   round: 1)).to eq '0.5h'
          expect(subject.timespan_in_words(12 * 60 * 60, unit: :days,    round: 1)).to eq '0.5d'
        end

        it 'should not include other remaining types' do
          # Seconds will be a tiny fraction of a second due to floating point
          # inaccuracies.
          expect(subject.timespan_in_words(251755, unit: :hours)).to eq '69.93h'
        end
      end
    end

  end
end

