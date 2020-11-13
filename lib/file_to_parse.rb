require_relative 'web_log_parser'

if ARGV.empty?
  puts 'You must pass a filepath to file_to_parse.rb'
else
  file_to_parse = WebLogParser.new(ARGV[0])
  file_to_parse.file_parser

  puts '-----'
  puts "Most Visited Pages (in descending order): #{file_to_parse.display_visits}"
  puts ''
  puts "Unique Page Views: #{file_to_parse.display_unique_visits}"
  puts '-----'
end

# when using launch files, can put the following comment at the top of the file to start it without passing the argument
# !/usr/local/bin/ruby -w
