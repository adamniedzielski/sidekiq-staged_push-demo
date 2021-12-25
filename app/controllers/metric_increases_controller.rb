class MetricIncreasesController < ApplicationController
  def new
  end

  def create
    Transaction.new do
      metric = Metric.find_or_create_by!(name: metric_increase_params.fetch(:name))
      IncreaseMetricWorker.perform_async(metric.id)
      raise ActiveRecord::Rollback if metric_increase_params.fetch(:fail)
    end
  end

  private

  def metric_increase_params
    params.require(:metric_increase).permit(:name, :fail)
  end
end
