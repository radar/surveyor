require 'spec_helper'

RSpec.describe Surveyor::Response, '04: Response' do
  # The code for this test lives in lib/surveyor/answer.rb

  subject { Surveyor::Response.new(user: "alice@example.com") }

  it "has no answers by default" do
    expect(subject.answers.count).to eq(0)
  end

  it "adds an answer to the response" do
    question = double(Surveyor::Question, type: 'rating')
    subject.answers << Surveyor::Answer.new(value: 5, question: question)
    expect(subject.answers.count).to eq(1)
  end
end
