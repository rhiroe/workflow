# frozen_string_literal: true

RSpec.describe Workflow::Actions::Manage::Users::Create do
  let(:params) { { "user" => { name: "佐藤 健" } } }

  it "works" do
    response = subject.call(params)
    expect(response).to be_successful
  end
end
