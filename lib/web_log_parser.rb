require 'open-uri'
require_relative 'visit'

# TO DO:
# Build initialize method taking filepath as an argument
# Build a file_parser method using File.foreach
# Build a visits_per_page method using group_by
# Build a page_visit_counter method using map and count
# Build a page_visit_sorter method using sort_by and reverse
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
end
