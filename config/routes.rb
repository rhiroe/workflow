# frozen_string_literal: true

module Workflow
  class Routes < Hanami::Routes
    root { "Hello from Hanami" }
    get "/manage/users", to: "manage.users.index"
    post "/manage/users", to: "manage.users.create"
  end
end
