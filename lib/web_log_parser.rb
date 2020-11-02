require 'open-uri'
require_relative 'visit'

# TO DO:
# Build a display_page_visits method using .join ?? Or combine with above
# Build a unique_visits method using .uniq.count and .sort_by
# Build a display_unique_visits method using .join ?? Or combine with above

class WebLogParser
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

  def page_visit_counter
    number_of_visits = visits_per_page.map { |page, visits| [page, visits.count] }
    number_of_visits.sort_by(&:last).reverse
    # number_of_visits.sort_by { |h| h.last }.reverse
  end

  def display_page_visits
  end

  def unique_visits_per_page
  end

  def display_unique_visits
  end

end
