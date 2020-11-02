# THE TASK

Write a ruby script that:
a. Receives a log as argument (webserver.log is provided) e.g.: ./parser.rb webserver.log
b. Returns the following:
  - list of webpages with most page views ordered from most pages views to less page views (e.g.: /home 90 visits /index 80 visits etc...)
  - list of webpages with most unique page views also ordered (e.g. /about/2 8 unique views /index 5 unique views etc...)

# MY APPROACH

- Familiarised myself with the requirements of the task
- Built my file structure
- Pseudocoded the steps required to complete the task
- Built the basic functionality until parser was functional
- Refactored my code to align with the DRY principle
- Familiarised myself with building tests using rspec
- Built tests for my 3 files `file_to_parse.rb, visit.rb, web_log_parser.rb`
- Checked my code passed my tests using rake

# IMPROVEMENTS

- Had I had more time, I would have liked to further familiarise myself with testing and built more rspec tests for my script
