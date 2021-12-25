class MetricIncreasesController < ApplicationController
  def new
    @metric_increase = MetricIncrease.new
  end

  def create
    metric_increase = MetricIncrease.new(metric_increase_params)

    Metric.transaction do
      metric = Metric.find_or_create_by!(name: metric_increase.name)
      IncreaseMetricWorker.perform_async(metric.id)
      raise ActiveRecord::Rollback if metric_increase.fail_operation?
    end

    redirect_to metrics_url
  end

  private

  def metric_increase_params
    params.require(:metric_increase).permit(:name, :fail_operation)
  end
end
