require 'spec_helper'

RSpec.describe Surveyor::Response, '04: Response' do
  subject { Surveyor::Response.new(user: "alice@example.com") }

  it "has no answers by default" do
    expect(subject.answers.count).to eq(0)
  end

  it "adds an answer to the response" do
    subject.answers << Surveyor::Answer.new(type: 'rating', value: 5, question: :q1)
    expect(subject.answers.count).to eq(1)
  end
end
