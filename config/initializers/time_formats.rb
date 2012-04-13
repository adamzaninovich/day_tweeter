Time::DATE_FORMATS[:month_and_year] = "%B %Y"
Time::DATE_FORMATS[:short_ordinal] = lambda { |time| time.strftime("%B #{time.day.ordinalize}") }
Time::DATE_FORMATS[:short_ordinal_with_time] = lambda { |time|
  time.strftime("%B #{time.day.ordinalize} at %l:%M:%S %p")
}
Time::DATE_FORMATS[:verbose] = "%e %b %Y %H:%M:%S %z (%Z)"
Time::DATE_FORMATS[:short_ordinal_with_time_and_zone] = lambda { |time|
  ampm = time.strftime('%p').downcase
  day = time.day.ordinalize
  time.strftime("%B #{day} at %l:%M#{ampm} %Z")
}