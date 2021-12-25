# frozen_string_literal: true

class IncreaseMetricJob
  include Sidekiq::Job

  sidekiq_options retry: 0

  # rubocop:disable Rails/SkipsModelValidations
  def perform(metric_id)
    metric = Metric.find(metric_id)
    metric.increment!(:value)
  end
  # rubocop:enable Rails/SkipsModelValidations
end
