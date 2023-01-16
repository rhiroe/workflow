# frozen_string_literal: true

module Workflow
  module Actions
    module Manage
      module Users
        class Index < Workflow::Action
          include Deps["persistence.rom"]

          def handle(*, response)
            users = rom.relations[:users].select(:id, :name).order(:id).to_a

            response.format = :json
            response.body = users.to_json
          end
        end
      end
    end
  end
end
