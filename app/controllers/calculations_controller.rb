class CalculationsController < ApplicationController
  before_action :set_last_calc, only: :create
  def index; end

  def create
    @calculation = Calculation.new(calc_params)
    @calculation[:result] = result(operation, first_num, second_num)

    respond_to do |format|
      if @calculation.save
        format.js
      else
        format.js { flash.now[:error] = @calculation.errors.full_messages[0] }
      end
    end
  end

  private

  def first_num
    params[:calculation][:field_a]
  end

  def second_num
    params[:calculation][:field_b]
  end

  def operation
    params[:calculation][:operation]
  end

  def set_last_calc
    @prev_calc = Calculation.last
  end

  def calc_params
    params.require(:calculation).permit(:field_a, :field_b, :operation)
  end

  def result(operation, first_num, second_num)
    Calculation.send(operation, *[first_num, second_num])
  end
end
