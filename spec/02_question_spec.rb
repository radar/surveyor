require 'spec_helper'

RSpec.describe Surveyor::Question, '02: Questions' do
  # The code for this test lives in lib/surveyor/question.rb

  it "builds a new question" do
    question = Surveyor::Question.new(
      title: 'Do you feel supported by your manager?',
      type: 'rating'
    )
    expect(question.title).to eq('Do you feel supported by your manager?')
    expect(question.type).to eq('rating')
  end
end
