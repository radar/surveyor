require 'spec_helper'

RSpec.describe Surveyor::Survey, '04: Surveys, questions and responses' do
  subject(:survey) { Surveyor::Survey.new(name: "ACME Engagement Survey") }
  let(:question) { double(Surveyor::Question) }
  let(:response) { double(Surveyor::Response) }

  it "has a name" do
    expect(survey.name).to eq("ACME Engagement Survey")
  end

  context "questions" do
    it "has no questions by default" do
      expect(survey.questions.count).to eq(0)
    end

    it "can add a question to the survey" do
      survey.questions << question
      expect(survey.questions.count).to eq(1)
    end
  end

  context "responses" do
    it "has no responses by default" do
      expect(survey.responses.count).to eq(0)
    end

    it "can add a response to the survey" do
      survey.responses << response
      expect(survey.responses.count).to eq(1)
    end
  end
end
