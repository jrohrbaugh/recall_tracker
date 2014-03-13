require 'open-uri'
require 'net/http'

# a recallable object has attributes is_recalled and recall_reason
module Recallable
  extend ActiveSupport::Concern

  included do
    before_save :check_recalled
  end

  def check_recalled
    self.class.check_recalled(self)
  end

  module ClassMethods
    def check_recalled(recallable)
      http = Net::HTTP.new("api.usa.gov")
      request = Net::HTTP::Get.new("/recalls/search.json?query=#{URI::encode(recallable.name)}")
      response = http.request(request)
      json = JSON.parse(response.body)
      if json["success"]
        total = json["success"]["total"].to_i
        if total > 0
          recallable.is_recalled = true
          recallable.recall_reason = json["success"]["results"].first["hazards"].join(', ')
        else
          recallable.is_recalled = false
          recallable.recall_reason = ""
        end
      else
        recallable.is_recalled = true
        recallable.recall_reason = "Error checking if recalled: #{json}"
     end

    end
  end
end
