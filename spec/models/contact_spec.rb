# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Contact, type: :model do
  it { should validate_presence_of :name }

  describe '#phone_type' do
    context 'when phone type is valid' do
      let(:contact) { create(:contact, phone_type: 2) }

      it 'can have a phone type between 0-3' do
        expect(contact.phone_type).to eq('home')
      end
    end

    context 'when phone type is invalid' do
      let(:contact) { create(:contact, phone_type: 4) }

      it { expect { raise contact.phone_type }.to raise_error(ArgumentError) }
    end
  end

  describe '#email_type' do
    context 'when email type is valid' do
      let(:contact) { create(:contact, email_type: 1) }

      it 'can have an email type between 0-1' do
        expect(contact.email_type).to eq('work')
      end
    end

    context 'when email type is invalid' do
      let(:contact) { create(:contact, email_type: 2) }

      it { expect { raise contact.email_type }.to raise_error(ArgumentError) }
    end
  end
end
