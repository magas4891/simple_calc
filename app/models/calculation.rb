# frozen_string_literal: true

class Calculation
  include Mongoid::Document

  field :field_a, type: String
  field :field_b, type: String
  field :operation, type: String
  field :result, type: String

  validates_presence_of :field_a, :field_b

  OPERATIONS = {
    sum: '+',
    sub: '-',
    mul: '*',
    div: '/'
  }.freeze

  def self.sum(val_a, val_b)
    val_a.to_i + val_b.to_i
  end

  def self.sub(val_a, val_b)
    val_a.to_i - val_b.to_i
  end

  def self.mul(val_a, val_b)
    val_a.to_i * val_b.to_i
  end

  def self.div(val_a, val_b)
    val_a.to_i / val_b.to_i
  rescue ZeroDivisionError => e
    e.message
  end
end
