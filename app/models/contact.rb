# frozen_string_literal: true

class Contact < ApplicationRecord
  validates :name, presence: true
  enum phone_type: %i[mobile office home other]
  enum email_type: %i[personal work]
end
