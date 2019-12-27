require 'date'

class Meetup
  attr_reader :month, :year
  
  WEEKDAYS = [:monday, :tuesday, :wednesday, :thursday, :friday, :saturday,
              :sunday]
  
  def initialize(month, year)
    @month, @year = month, year
  end
  
  def day(weekday, schedule)
    date_range, week_num = nil
    
    case schedule
    when :teenth
      date_range = [13, 19]
      week_num = 0
    when :first, :second, :third, :fourth
      date_range = [1, -1]
      week_num = [:first, :second, :third, :fourth].index(schedule)
    when :last
      date_range = [1, -1]
      week_num = -1
    end
    
    day = arr_weekday_in_range(weekday, date_range)[week_num].day   
    Date.new(year, month, day)
  end
  
  def arr_weekday_in_range(weekday, range)
    first_num, last_num = range
    
    start_date = Date.new(year, month, first_num)
    end_date = Date.new(year, month, last_num)
    
    start_date.step(end_date).select do |date|
      date.cwday == WEEKDAYS.index(weekday) + 1
    end
  end
end

p Meetup.new(5, 2013).day(:monday, :teenth)
p Meetup.new(5, 2013).day(:tuesday, :first)
p Meetup.new(8, 2013).day(:monday, :teenth)