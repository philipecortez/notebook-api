require 'rails_helper'

RSpec.describe Api::V1::KindsController do
  describe 'GET #index' do
    before do
      @kinds = create(:kind, description: 'teste')
    end

    it 'returns a array of kinds' do
      get :index

      expect(response.body).to eq([@kinds].to_json)
      expect(response.status).to eq(200)
    end
  end

  describe 'GET #show' do
    before do
      @kind = create(:kind)
    end

    it 'returns one specific kind' do
      get :show, params: { id: 1 }

      expect(response.body).to eq(@kind.to_json)
      expect(response.status).to eq(200)
    end
  end

  describe 'POST #create' do
    context 'when the params are ok' do
      it 'creates a kind based on params' do
        post :create, params: {
          kind: {
            description: 'teste'
          }
        }

        expect(response.body).to eq(Kind.last.to_json)
        expect(response.status).to eq(201)
      end
    end

    context 'when there is a problem with the params' do
      before do
        @expected_response = {
          description: ["Nao pode estar em branco"]
        }.to_json
      end

      it 'returns an error message' do
        post :create, params: {
          kind: {
            description: ''
          }
        }

        expect(response.body).to eq(@expected_response)
        expect(response.status).to eq(422)
      end
    end

    describe 'PATCH/PUT #update' do
      context 'when the params are ok' do
        before do
          @kind = create(:kind)
        end

        it 'updates an existent kind' do
          patch :update, params: {
            id: 1,
            kind: {
              description: 'teste'
            }
          }

          expect(response.status).to eq(200)
          expect(@kind.reload.description).to eq('teste')
        end
      end

      context 'when there is a problem with the params' do
        before do
          create(:kind)
          @expected_response = { description: ['Nao pode estar em branco'] }.to_json
        end

        it 'returns an error message' do
          patch :update, params: {
            id: 1,
            kind: {
              description: ''
            }
          }

          expect(response.body).to eq(@expected_response)
          expect(response.status).to eq(422)
        end
      end
    end

    describe 'DELETE #destroy' do
      before do
        create(:kind)
      end

      it 'delete a specific record' do
        delete :destroy, params: { id: 1 }

        expect(Kind.count).to eq(0)
        expect(response.status).to eq(204)
      end
    end
  end
end