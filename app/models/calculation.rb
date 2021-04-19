# frozen_string_literal: true

class Calculation
  include Mongoid::Document

  field :field_a, type: Integer
  field :field_b, type: Integer
  field :operation, type: String
  field :result, type: String

  validates_presence_of :field_a, :field_b

  OPERATIONS = %i[+ - * /].freeze
end
