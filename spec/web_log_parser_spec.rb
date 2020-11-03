require 'web_log_parser'
require 'visit'

describe WebLogParser do
  before :each do
    @file = WebLogParser.new('webserver.log')
  end

  describe 'initialize' do
    it 'should contain a filepath' do
      expect(@file.filepath).to eq('webserver.log')
    end

    it 'should contain an empty array for visits' do
      expect(@file.visits_log).to eq([])
    end
  end

  describe '#file_parser' do
    it 'iterates over the webserver.log file and creates a new instance of Visit' do
      @file.file_parser
      expect(@file.visits_log).not_to eq 0
      expect(@file.visits_log).to include(Visit)
    end
  end

  describe '#visits_per_page' do
    it 'should group visits by page' do
      @file.file_parser
      expect(@file.visits_log).to_not eq 0
      expect(@file.visits_log[0].ip_address).to eq('126.318.035.038')
    end
  end

  describe '#page_visits_counter' do
    it 'should count the number of visits per page' do
      @file.file_parser
      expect(@file.page_visits_counter.size).not_to eq 0
    end

    it 'should sort the visits in descending order' do
      @file.file_parser
      expect(@file.page_visits_counter).to start_with("/about/2 90 visits /contact 89 visits")
    end
  end

  describe '#display_unique_visits' do
    it 'should calculate unique visits per page' do
      @file.file_parser
      expect(@file.display_unique_visits).to start_with('/help_page/1 23')
    end
  end
end
