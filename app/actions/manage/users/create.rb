# frozen_string_literal: true

module Workflow
  module Actions
    module Manage
      module Users
        class Create < Workflow::Action
          include Deps["persistence.rom"]

          params do
            required(:user).hash do
              required(:name).filled(:string, size?: 1..128)
            end
          end

          def handle(request, response)
            if request.params.valid?
              user = rom.relations[:users].changeset(:create, request.params[:user]).commit

              response.status = 201
              response.body = user.to_json
            else
              response.status = 422
              response.format = :json
              response.body = request.params.errors.to_json
            end
          end
        end
      end
    end
  end
end
