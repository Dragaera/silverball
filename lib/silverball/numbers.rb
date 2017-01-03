# coding_ utf-8

module Silverball
  module Numbers
    def number_with_separator(number, sep = "'")
      number.to_s.reverse.gsub(/\d\d\d(?=\d)/) { |s| "#{ s }#{ sep }" }.reverse
    end

    def fraction_as_percentage(part, full, accuracy = 1)
      percentage = (part * 100.0 / full).round(accuracy)

      "#{ percentage }%"
    end
  end
end
