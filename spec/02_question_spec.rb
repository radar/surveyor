require 'spec_helper'

RSpec.describe Surveyor::Question do
  it "builds a new question" do
    question = Surveyor::Question.new(title: 'Do you feel supported by your manager?')
    expect(question.title).to eq('Do you feel supported by your manager?')
  end
end
