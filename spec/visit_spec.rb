require 'visit'

describe Visit do
  describe 'initialize' do
    it 'should return a page url' do
      page_url = '/help_page/1'
      ip_address = '126.318.035.038'
      visit = Visit.new(page_url, ip_address)
      expect(visit.page_url).to eq('/help_page/1')
    end

    it 'should return an ip address' do
      page_url = '/help_page/1'
      ip_address = '126.318.035.038'
      visit = Visit.new(page_url, ip_address)
      expect(visit.ip_address).to eq('126.318.035.038')
    end
  end
end
