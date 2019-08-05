require 'rails_helper'

RSpec.describe Api::V1::ContactsController do
  describe 'GET #index' do
    before  do
      @contact = create(:contact)
    end

    it 'renders all the contacts' do
      get :index

      expect(response.status).to eq(200)
      expect(response.body).to eq([@contact].to_json)
    end
  end

  describe 'GET #show' do
    before do
      @contact = create(:contact)
    end

    it 'renders one specific contact' do
      get :show, params: { id: @contact.id }

      expect(response.status).to eq(200)
      expect(response.body).to eq(@contact.to_json)
    end
  end

  describe 'POST #create' do
    before do
      ['Friend', 'Coleague', 'Comercial'].each do |kind|
        create(:kind, description: kind)
      end
    end

    context 'when the params are ok' do
      it 'creates a contact according to the params' do
        post :create, params: { 
          contact: {
            name: 'Philipe',
            email: 'philipesousacortez@protonmail.com',
            birthdate: '1993-09-17',
            kind_id: 1
          }
        }

        expect(response.status).to eq(201)
        expect(response.body).to eq(Contact.last.to_json)
      end
    end

    context 'when there are problems with the params' do
      before do
        @expected_response = {
          email: ["Nao pode estar em branco"]
        }
      end

      it 'returns an error' do
        post :create, params: {
          contact: {
            name: 'Philipe',
            email: '',
            date: '1993-09-17',
            kind_id: 1
          }
        }

        expect(response.status).to eq(422)
        expect(response.body).to eq(@expected_response.to_json)
      end
    end
  end

  describe 'PUT #update' do
    context 'when the params are ok' do
      before do
        @contact = create(:contact, name: 'Bryan')
      end

      it 'updates the contact' do
        patch :update, params: {
          id: @contact.id,
          contact: {
            name: 'John Doe'
          }
        }

        expect(response.status).to eq(200)
        expect(@contact.reload.name).to eq('John Doe')
      end
    end

    context 'when there are problems with the params' do
      before do
        create(:contact, name: "Bryan", email: "aleshia.kris@example.org", birthdate: "2000-07-06")
        create(:contact, name: "John Doe")
        @expected_response = { name: ["Ja esta sendo usado"] }
      end

      it 'returns an error' do
        put :update, params: {
          id: 1,
          contact: {
            name: 'John Doe'
          }
        }

        expect(response.status).to eq(422)
        expect(response.body).to eq(@expected_response.to_json)
      end
    end
  end

  describe 'DELETE #delete' do
    before do
      @contact = create(:contact)
    end

    it 'destroys the contact' do
      delete :destroy, params: { id: @contact.id }
      
      expect(response.status).to eq(204)
      expect(Contact.count).to eq(0)
    end
  end
end