require "spec_helper"

RSpec.describe Scalingo::Regional::Operations do
  let(:endpoint) { regional.operations }

  context "find" do
    context "success" do
      let(:response) { endpoint.find(meta[:app_id], meta[:id]) }
      let(:stub_pattern) { "find-200" }

      it_behaves_like "a successful response"

      context "request customization" do
        let(:method_name) { "find" }
        let(:valid_arguments) { [meta[:app_id], meta[:id]] }

        it_behaves_like "a method with a configurable request"
      end
    end

    context "failure" do
      let(:response) { endpoint.find(meta[:app_id], meta[:not_found_id]) }
      let(:stub_pattern) { "find-404" }

      it_behaves_like "a not found response"
    end
  end
end
