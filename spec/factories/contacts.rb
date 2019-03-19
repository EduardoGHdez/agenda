# frozen_string_literal: true

FactoryBot.define do
  factory :contact do
    name { 'Eduardo' }
    lastname { 'Hernandez' }
    phone { '4771234556' }
    phone_type { 1 }
    email { 'eduardo.garcia@magmalabs.io' }
    email_type { 1 }
    notes { 'No notes' }
  end
end
