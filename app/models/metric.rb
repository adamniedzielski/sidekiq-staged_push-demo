# frozen_string_literal: true

class Metric < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :value, presence: true, numericality:
    { only_integer: true, greater_than_or_equal_to: 0 }
end
