# frozen_string_literal: true

FactoryBot.define do
  factory :contact do
    name { 'Eduardo' }
    lastname { 'Hernandez' }
    phone { '477 123 4556' }
    phone_type { 'mobile' }
    email { 'eduardo.garcia@magmalabs.io' }
    email_type { 'personal' }
    notes { 'No notes' }
  end
end
