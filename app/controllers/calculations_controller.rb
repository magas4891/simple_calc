# frozen_string_literal: true

class CalculationsController < ApplicationController
  before_action :find_calculation, only: :create

  def index; end

  def create
    if @calculation
      # TODO:
      calc[:result] = @calculation
    elsif first_num && second_num && operation
      result = result(operation, first_num, second_num)
      @calculation = Calculation.create(result: result,
                                        field_a: first_num,
                                        field_b: second_num,
                                        operation: operation)
    else
      respond_to { |format| format.js { flash.now[:error] = 'Fill in all inputs!' } }
    end
  end

  private

  def first_num
    params[:calculation][:field_a].presence&.to_i
  end

  def second_num
    params[:calculation][:field_b].presence&.to_i
  end

  def operation
    params[:calculation][:operation].presence&.to_sym
  end

  def calc_params
    params.require(:calculation).permit(:field_a, :field_b, :operation)
  end

  def result(operation, first_num, second_num)
    # find already created same operating => increment
    first_num.public_send(operation, second_num)
  end

  def find_calculation
    # @calculation
  end
end
