require "spec_helper"

RSpec.describe Scalingo::Regional::Operations do
  describe_method "get" do
    context "success" do
      let(:arguments) { "apps/#{meta[:app_id]}/operations/#{meta[:id]}" }
      let(:stub_pattern) { "find-200" }

      it_behaves_like "a singular object response"
    end

    context "failure" do
      let(:arguments) { "apps/#{meta[:app_id]}/operations/#{meta[:not_found_id]}" }
      let(:stub_pattern) { "find-404" }

      it_behaves_like "a not found response"
    end
  end

  describe_method "find" do
    it "delegates to get" do
      expect(subject).to receive(:get).with("apps/a/operations/b", :headers).once

      subject.find(:a, :b, :headers)
    end
  end
end
