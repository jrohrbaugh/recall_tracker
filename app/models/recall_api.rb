require 'open-uri'
require 'net/http'

class RecallApi
  def self.is_recalled?(name)
    http = Net::HTTP.new("api.usa.gov")
    request = Net::HTTP::Get.new("/recalls/search.json?query=#{URI::encode(name)}")
    response = http.request(request)
    json = JSON.parse(response.body)
    if json["success"]
      total = json["success"]["total"].to_i
      if total > 0
        return json["success"]["results"].first["hazards"].join(', ')
      else
        return false
      end
    else
      # TODO: report the error somehow
      false
    end
  end
end