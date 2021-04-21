# frozen_string_literal: true

FactoryBot.define do
  factory :calculation do
    field_a { 10 }
    field_b { 5 }
    operation { '+' }
  end
end
