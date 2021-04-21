# frozen_string_literal: true

class Calculation
  include Mongoid::Document

  field :field_a, type: Integer
  field :field_b, type: Integer
  field :operation, type: String
  field :result, type: Integer
  field :count, type: Integer, default: 0

  validates_presence_of :field_a, :field_b

  OPERATIONS = %i[+ - * /].freeze
end
