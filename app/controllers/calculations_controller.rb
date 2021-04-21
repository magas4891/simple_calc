# frozen_string_literal: true

class CalculationsController < ApplicationController
  def index; end

  def create
    if first_num && second_num && operation
      @calculation = Calculation.where(calc_params).first_or_create do |calculation|
        calculation.result = result(operation, first_num, second_num)
      end
      @calculation.count += 1
      @calculation.save
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
    first_num.public_send(operation, second_num)
  end
end
