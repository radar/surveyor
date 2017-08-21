require 'spec_helper'

RSpec.describe Surveyor::Answer, '03: Answer validations' do
  # The code for this test lives in lib/surveyor/answer.rb

  let(:question) { double(Surveyor::Question, type: 'rating') }

  context "question validation" do
    context "when the answer has a question" do
      subject { described_class.new(question: question, value: 5) }
      it { should be_valid }
    end

    context "when the answer has no question" do
      subject { described_class.new(value: 5) }
      it { should_not be_valid }
    end
  end

  context "for a rating question" do
    # NOTE: Rating questions are rated between 1 and 5.
    let(:question) { double(Surveyor::Question, type: 'rating') }

    context "when the value is 1" do
      subject do
        described_class.new(
          question: question,
          value: 1
        )
      end

      it { should be_valid }
    end

    context "when the value is 5" do
      subject do
        described_class.new(
          question: question,
          value: 5
        )
      end

      it { should be_valid }
    end

    context "when the value is 6" do
      subject do
        described_class.new(
          question: question,
          value: 6
        )
      end

      it { should_not be_valid }
    end
  end

  context "for a free text question" do
    let(:question) { double(Surveyor::Question, type: 'free_text') }

    # NOTE: The rating validations should not apply for 'free_text' questions.
    subject { described_class.new(question: question, value: 'anything') }
    it { should be_valid }
  end
end
