# frozen_string_literal: true

class MetricsController < ApplicationController
  def index
    @metrics = Metric.all
  end
end
