require 'uri'
require 'net/http'
require 'openssl'
require 'json'

class CurrentLocation

  def self.ip_getter
    url = URI("https://api.ipify.org/?format=json")
    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    request = Net::HTTP::Get.new(url)
    response = http.request(request)
    doc = JSON.parse(response.body)
    doc['ip']
  end

  def self.location_info
    ip_address = self.ip_getter
    url = URI("https://ipinfo.io/#{ip_address}/geo")
    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    request = Net::HTTP::Get.new(url)
    response = http.request(request)
    doc = JSON.parse(response.body)
    doc
  end

  def self.seed_user
    ip_address = self.ip_getter
    url = URI("https://randomuser.me/api/")
    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    request = Net::HTTP::Get.new(url)
    response = http.request(request)
    doc = JSON.parse(response.body)
    doc
  end
  
end
