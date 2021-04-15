class Calculation
  include Mongoid::Document
  field :field_a, type: String
  field :field_b, type: String
  field :operation, type: String
  field :result, type: String

  OPERATIONS = {
    sum: '+',
    sub: '-',
    mul: '*',
    div: '/'
  }.freeze

  def self.sum(a, b)
    a.to_i + b.to_i
  end

  def self.sub(a, b)
    a.to_i - b.to_i
  end

  def self.mul(a, b)
    a.to_i * b.to_i
  end

  def self.div(a, b)
    a.to_i / b.to_i
  end
end
