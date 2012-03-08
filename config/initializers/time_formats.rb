Time::DATE_FORMATS[:month_and_year] = "%B %Y"
Time::DATE_FORMATS[:short_ordinal] = lambda { |time| time.strftime("%B #{time.day.ordinalize}") }
Time::DATE_FORMATS[:short_ordinal_with_time] = lambda { |time|
  time.strftime("%B #{time.day.ordinalize} at %l:%M:%S %p")
}