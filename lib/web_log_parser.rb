require 'open-uri'
require_relative 'visit'

class WebLogParser
  attr_reader :filepath, :visits_log

  def initialize(filepath)
    @filepath = filepath
    @visits_log = []
  end

  def file_parser
    File.foreach(@filepath) do |line|
      page_url, ip_address = line.split
      @visits_log = Visit.new(page_url, ip_address)
    end
  end

  def visits_per_page
    @visits_log.group_by(&:page_url)
    # @visits_log.group_by { |number| number.page_url }
  end

  def page_visits_counter
    number_of_visits = visits_per_page.map { |page, visits| [page, visits.count] }
    ordered_visits = number_of_visits.sort_by(&:last).reverse
    # number_of_visits.sort_by { |h| h.last }.reverse
    ordered_visits.join(' ')
  end

  def unique_visits_per_page
    visits_per_page.map do |key, value|
      [key, value.map(&:ip_address).uniq.count]
    end.sort_by(&:last).reverse
  end

  def display_unique_visits
    unique_visits_per_page.join(' ')
  end
end
