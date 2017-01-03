# coding_ utf-8

module Silverball
  module DateTime
    SECONDS_PER_MINUTE = 60
    SECONDS_PER_HOUR = SECONDS_PER_MINUTE * 60
    SECONDS_PER_DAY = SECONDS_PER_HOUR * 24

    def timespan_in_words(seconds)
      if seconds >= SECONDS_PER_DAY
        days = seconds / SECONDS_PER_DAY
        seconds -= days * SECONDS_PER_DAY
      else
        days = 0
      end

      if seconds >= SECONDS_PER_HOUR
        hours = seconds / SECONDS_PER_HOUR
        seconds -= hours * SECONDS_PER_HOUR
      else
        hours = 0
      end

      if seconds >= SECONDS_PER_MINUTE
        minutes = seconds / SECONDS_PER_MINUTE
        seconds -= minutes * SECONDS_PER_MINUTE
      else
        minutes = 0
      end

      out = []
      out << "#{ days }d" if days > 0
      out << "#{ hours }h" if hours > 0
      out << "#{ minutes }m" if minutes > 0
      out << "#{ seconds }s" if seconds > 0 || (seconds == 0 && minutes == 0 && hours == 0 && days == 0)

      out.join(' ')
    end
  end
end
