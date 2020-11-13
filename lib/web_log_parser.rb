require 'open-uri'
require_relative 'visit'
# require 'pry-byebug'

# split more for separation of concerns - think of how it would work with bigger programs
# e.g. logsorter class etc, split up better

# don't need to use global variables directly due to the attr_reader

# encapsulation: make more methods private!! including attr_readers

class WebLogParser
  attr_reader :filepath, :visits_log

  def initialize(filepath)
    @filepath = filepath
    @visits_log = []
  end

  # Method to parse webserver.log file
  def file_parser
    File.foreach(@filepath) do |line|
      page_url, ip_address = line.split
      @visits_log << Visit.new(page_url, ip_address)
    end
  end

  # foreach useful for larger files too - parses the file line by line,
  # file read reads it all at once, processing speeds slower

  # Method to group visits by page
  def visits_per_page
    @visits_log.group_by(&:page_url)
  end

  # Method to count the number of visits and sort in descending order, then display with 'visits' appended to number
  def page_visits_counter
    number_of_visits = visits_per_page.map { |page, visits| [page, visits.count] }
    number_of_visits.sort_by { |h| -h.last }
  end

  # split into separate method for readability
  def display_visits
    page_visits_counter.each do |value|
      value[1] = "#{value[1]} visits"
    end.flatten.join(' ')
  end

  # Method to calculate unique visits per page
  def unique_visits_per_page
    unique_visits = visits_per_page.map do |key, value|
      [key, value.map(&:ip_address).uniq.count]
    end
    unique_visits.sort_by { |h| -h.last }
  end

  # Separate method to display unique visits to keep unique_visits_per_page method from being too long
  def display_unique_visits
    unique_visits_per_page.each do |value|
      value[1] = "#{value[1]} unique views"
    end.flatten.join(' ')
  end

  def fizz_buzz
    (1..20).map do |i|
      if (i % 3).zero? && (i % 5).zero?
        puts 'FizzBuzz'
      elsif (i % 3).zero?
        puts 'Fizz'
      elsif (i % 5).zero?
        puts 'Buzz'
      else
        puts i
      end
    end
  end
end
