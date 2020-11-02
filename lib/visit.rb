class Visit
  attr_reader :page_url, :ip_address

  def initialize(page_url, ip_address)
    @page_url = page_url
    @ip_address = ip_address
  end
end
