# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ContactsController, type: :controller do
  let(:contact) { create(:contact) }

  describe 'GET #index' do
    it 'returns a success response' do
      create :contact
      get :index
      expect(response).to be_successful
    end
  end

  describe 'GET #show' do
    subject { get :show, params: { id: contact.to_param } }

    it 'returns a success response' do
      expect(response).to be_successful
    end
  end

  describe 'GET #new' do
    subject { get :new }

    it 'returns a success response' do
      expect(subject).to be_successful
    end
  end

  describe 'GET #edit' do
    subject { get :edit, params: { id: contact.to_param } }

    it 'returns a success response' do
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    subject { post :create, params: { contact: params } }

    context 'with valid params' do
      let(:params) { attributes_for :contact }

      it 'creates a new Contact' do
        contact
        expect { subject }.to change(Contact, :count).by(1)
      end

      it 'redirects to the created contact' do
        expect(subject).to redirect_to(Contact.last)
      end
    end

    context 'with invalid params' do
      let(:params) { attributes_for(:contact, name: nil) }
      it "returns a success response (i.e. to display the 'new' template)" do
        expect(response).to be_successful
      end
    end
  end

  describe 'PUT #update' do
    subject { put :update, params: { id: contact.to_param, contact: params } }

    context 'with valid params' do
      let(:params) { { name: 'Edited' } }

      it 'updates the requested contact' do
        subject
        contact.reload
        expect(contact.name).to eq('Edited')
      end

      it 'redirects to the contact' do
        expect(subject).to redirect_to(contact)
      end
    end

    context 'with invalid params' do
      let(:params) { { name: '' } }
      let!(:original_name) { contact.name }

      it "returns a success response (i.e. to display the 'edit' template)" do
        expect(response).to be_successful
      end

      it 'does not update the requested contact' do
        subject
        contact.reload
        expect(contact.name).to eq(original_name)
      end
    end
  end

  describe 'DELETE #destroy' do
    before { contact }

    subject { delete :destroy, params: { id: contact.to_param } }

    it 'destroys the requested contact' do
      expect { subject }.to change(Contact, :count).by(-1)
    end

    it 'redirects to the contacts list' do
      expect(subject).to redirect_to(contacts_url)
    end
  end
end
