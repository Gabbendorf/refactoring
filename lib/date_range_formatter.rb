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
    @full_start_date = format_full_date(@start_date)
    @full_end_date = format_full_date(@end_date)
  end

  def format
    if start_date == end_date
      format_same_dates
    else
      format_different_dates
    end
  end

  private

  def format_full_date(date)
    date.strftime("#{DayOrdinalizer.ordinalize(date.day)} %B %Y")
  end

  def format_same_dates
    if start_time && end_time
      "#{format_single_date(@full_start_date, start_time)} to #{end_time}"
    elsif start_time
      format_single_date(@full_start_date, start_time)
    elsif end_time
      "#{format_single_date(@full_start_date, start_time)} until #{end_time}"
    else
      format_single_date(@full_start_date, start_time)
    end
  end

  def format_different_dates
    if start_time && end_time
      "#{format_single_date(@full_start_date, start_time)} - #{format_single_date(@full_end_date, end_time)}"
    elsif start_time
      "#{format_single_date(@full_start_date, start_time)} - #{format_single_date(@full_end_date, end_time)}"
    elsif end_time
      "#{format_single_date(@full_start_date, start_time)} - #{format_single_date(@full_end_date, end_time)}"
    else
      "#{format_single_date(@full_start_date, start_time)} - #{format_single_date(@full_end_date, end_time)}"
    end
  end

  def format_single_date(date, time)
    if time
      "#{date} at #{time}"
    else
      date
    end
  end
end
