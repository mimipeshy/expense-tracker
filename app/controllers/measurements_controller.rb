class MeasurementsController < ApplicationController
  before_action :set_expense
  before_action :set_expense_measurement, only: %i[show update destroy]

  def index
    json_response(@expense.measurements)
  end

  def show
    json_response(@measurement)
  end

  def create
    @expense.measurements.create!(measurement_params)
    json_response(@expense, :created)
  end

  def update
    @measurement.update(measurement_params)
    json_response(@expense, :updated)
  end

  def destroy
    @measurement.destroy
    head :no_content
  end

  private

  def measurement_params
    params.permit(:amount, :date)
  end

  def set_expense
    @expense = Expense.find(params[:expense_id])
  end

  def set_expense_measurement
    @measurement = @expense.measurements.find_by!(id: params[:id]) if @expense
  end
end
