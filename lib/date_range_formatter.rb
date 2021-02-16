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
      format_same_date(full_start_date)
    else
      format_different_dates(full_start_date, full_end_date)
    end
  end

  private

  def format_full_date(date)
    date.strftime("#{DayOrdinalizer.ordinalize(date.day)} %B %Y")
  end

  def format_same_date(full_start_date)
    if start_time && end_time
      "#{full_start_date} at #{start_time} to #{end_time}"
    elsif start_time
      "#{full_start_date} at #{start_time}"
    elsif end_time
      "#{full_start_date} until #{end_time}"
    else
      full_start_date
    end
  end

  def format_different_dates(full_start_date, full_end_date)
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
