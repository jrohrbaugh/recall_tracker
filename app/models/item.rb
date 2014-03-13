class Item < ActiveRecord::Base
  after_create :check_recalled!

  def check_recalled!
    hazard_str = RecallApi.is_recalled?(self.name)
    # self.hazards = hazard_str if hazard_str
    self.update_attribute(:recalled, hazard_str.present?)
  end
end
