# frozen_string_literal: true

require "date"
require "day_ordinalizer"

class DateRangeFormatter
  attr_reader :start_date, :end_date, :start_time, :end_time

  def initialize(start_date, end_date, start_time = nil, end_time = nil)
    @start_date = Date.parse(start_date)
    @end_date = Date.parse(end_date)
    @start_time = start_time
    @end_time = end_time
  end

  def format
    full_start_date = format_full_date(start_date)
    full_end_date = format_full_date(end_date)

    if start_date == end_date
      if start_time && end_time
        "#{full_start_date} at #{start_time} to #{end_time}"
      elsif start_time
        "#{full_start_date} at #{start_time}"
      elsif end_time
        "#{full_start_date} until #{end_time}"
      else
        full_start_date
      end
    elsif start_date.month == end_date.month
      if start_time && end_time
        "#{full_start_date} at #{start_time} - #{full_end_date} at #{end_time}"
      elsif start_time
        "#{full_start_date} at #{start_time} - #{full_end_date}"
      elsif end_time
        "#{full_start_date} - #{full_end_date} at #{end_time}"
      else
        start_date.strftime("#{DayOrdinalizer.ordinalize(start_date.day)} %B %Y - #{DayOrdinalizer.ordinalize(end_date.day)} %B %Y")
      end
    elsif start_date.year == end_date.year
      if start_time && end_time
        "#{full_start_date} at #{start_time} - #{full_end_date} at #{end_time}"
      elsif start_time
        "#{full_start_date} at #{start_time} - #{full_end_date}"
      elsif end_time
        "#{full_start_date} - #{full_end_date} at #{end_time}"
      else
        start_date.strftime("#{DayOrdinalizer.ordinalize(start_date.day)} %B %Y - ") + end_date.strftime("#{DayOrdinalizer.ordinalize(end_date.day)} %B %Y")
      end
    else
      if start_time && end_time
        "#{full_start_date} at #{start_time} - #{full_end_date} at #{end_time}"
      elsif start_time
        "#{full_start_date} at #{start_time} - #{full_end_date}"
      elsif end_time
        "#{full_start_date} - #{full_end_date} at #{end_time}"
      else
        "#{full_start_date} - #{full_end_date}"
      end
    end
  end

  private

  def format_full_date(date)
    date.strftime("#{DayOrdinalizer.ordinalize(date.day)} %B %Y")
  end
end
