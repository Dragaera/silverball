# coding_ utf-8

module Silverball
  module DateTime
    SECONDS_PER_MINUTE = 60
    SECONDS_PER_HOUR = SECONDS_PER_MINUTE * 60
    SECONDS_PER_DAY = SECONDS_PER_HOUR * 24

    def timespan_in_words(seconds, unit: nil, round: 2)
      seconds = seconds.to_f unless unit.nil?

      if (seconds >= SECONDS_PER_DAY && unit.nil?) || unit == :days
        days = seconds / SECONDS_PER_DAY
        seconds -= days * SECONDS_PER_DAY

        if unit == :days
          if days == days.to_i
            days = days.to_i
          else
            days - days.round(round)
          end
        end
      else
        days = 0
      end

      if (seconds >= SECONDS_PER_HOUR && unit.nil?) || unit == :hours
        hours = seconds / SECONDS_PER_HOUR
        seconds -= hours * SECONDS_PER_HOUR

        if unit == :hours
          if hours == hours.to_i
            hours = hours.to_i
          else
            hours = hours.round(round)
          end
        end
      else
        hours = 0
      end

      if (seconds >= SECONDS_PER_MINUTE && unit.nil?) || unit == :minutes
        minutes = seconds / SECONDS_PER_MINUTE
        seconds -= minutes * SECONDS_PER_MINUTE

        if unit == :minutes
          if minutes == minutes.to_i
            minutes = minutes.to_i
          else
            minutes = minutes.round(round)
          end
        end
      else
        minutes = 0
      end

      if unit == :seconds
        if seconds == seconds.to_i
          seconds = seconds.to_i
        else
          seconds = seconds.round(round)
        end
      end

      if unit == :days
        "#{ days }d"
      elsif unit == :hours
        "#{ hours }h"
      elsif unit == :minutes
        "#{ minutes }m"
      else
        out = []
        out << "#{ days }d" if days > 0
        out << "#{ hours }h" if hours > 0
        out << "#{ minutes }m" if minutes > 0
        out << "#{ seconds }s" if seconds > 0 || (seconds == 0 && minutes == 0 && hours == 0 && days == 0)

        out.join(' ')
      end
    end
  end
end
