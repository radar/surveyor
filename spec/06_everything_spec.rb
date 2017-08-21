require 'spec_helper'

RSpec.describe '06: Everything together' do
  # The code for this test lives in lib/surveyor/survey.rb

  let(:survey) { Surveyor::Survey.new(name: 'ACME Engagement Survey') }
  let(:question_1) do
    Surveyor::Question.new(
      title: 'Do you feel supported by your manager?',
      type: 'rating',
    )
  end

  let(:question_2) do
    Surveyor::Question.new(
      title: 'Do you feel like the work you do is meaningful?',
      type: 'rating',
    )
  end

  let(:response_1) { Surveyor::Response.new(user: "alice@example.com") }
  let(:answer_1_1) { Surveyor::Answer.new(value: 5, question: question_1) }
  let(:answer_1_2) { Surveyor::Answer.new(value: 3, question: question_2) }

  let(:response_2) { Surveyor::Response.new(user: "bob@example.com") }
  let(:answer_2_1) { Surveyor::Answer.new(value: 3, question: question_1) }
  let(:answer_2_2) { Surveyor::Answer.new(value: 3, question: question_2) }

  let(:response_3) { Surveyor::Response.new(user: "claire@example.com") }
  let(:answer_3_1) { Surveyor::Answer.new(value: 5, question: question_1) }

  before do
    survey.questions << question_1
    survey.questions << question_2

    survey.responses << response_1
    survey.responses << response_2
    survey.responses << response_3

    response_1.answers << answer_1_1
    response_1.answers << answer_1_2

    response_2.answers << answer_2_1
    response_2.answers << answer_2_2

    response_3.answers << answer_3_1
  end

  context "participation_percentage" do
    it "calculates participation percentage for question 1" do
      expect(survey.participation_percentage(question_1)).to eq(100)
    end

    it "calculates participation percentage for question 1" do
      expect(survey.participation_percentage(question_2)).to eq(66.67)
    end
  end

  context "ratings" do
    it "collects ratings for question 1" do
      expect(survey.ratings(question_1)).to eq(
        1 => 0,
        2 => 0,
        3 => 1,
        4 => 0,
        5 => 2
      )
    end

    it "collects ratings for question 2" do
      expect(survey.ratings(question_2)).to eq(
        1 => 0,
        2 => 0,
        3 => 2,
        4 => 0,
        5 => 0
      )
    end
  end
end
