class WeightRecord < ApplicationRecord
  belongs_to :cattle

  before_save :calculate_weight_difference

  private

  def calculate_weight_difference
    self.previous_weight ||= 0
    self.weight_difference = new_weight - previous_weight if new_weight.present?  
  end
end
