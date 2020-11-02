require_relative 'web_log_parser'

file_to_parse = WebLogParser.new(ARGV[0])

file_to_parse.file_parser

puts "Most Visited Pages (in descending order): #{file_to_parse.page_visit_counter}"
puts "Unique Page Views: #{file_to_parse.display_unique_visits}"
