# frozen_string_literal: true

class MetricIncrease
  include ActiveModel::Model
  attr_accessor :name, :fail_operation

  def fail_operation?
    fail_operation == "1"
  end
end
