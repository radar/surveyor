require 'spec_helper'

RSpec.describe Surveyor::Answer, '02: Answer validations' do
  let(:question) { double(Surveyor::Question) }

  context "question validation" do
    context "when the answer has a question" do
      subject { described_class.new(question: question) }
      it { should be_valid }
    end

    context "when the answer has no question" do
      subject { described_class.new }
      it { should_not be_valid }
    end
  end

  context "for a rating question" do
    # NOTE: Rating questions are rated between 1 and 5.
    context "when the value is 1" do
      subject do
        described_class.new(
          question: question,
          type: 'rating',
          value: 1
        )
      end

      it { should be_valid }
    end

    context "when the value is 5" do
      subject do
        described_class.new(
          question: question,
          type: 'rating',
          value: 5
        )
      end

      it { should be_valid }
    end

    context "when the value is 6" do
      subject do
        described_class.new(
          question: question,
          type: 'rating',
          value: 6
        )
      end

      it { should_not be_valid }
    end
  end

  context "for a free text question" do
    # NOTE: The rating validations should not apply for 'free_text' questions.
    subject { described_class.new(type: 'free_text', value: 'anything') }
    it { should be_valid }
  end
end
