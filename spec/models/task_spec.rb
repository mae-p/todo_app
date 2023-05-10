require 'rails_helper'

RSpec.describe Task, type: :model do
  it "is valid with a title, deadline" do 
    task = Task.new(title: 'Example', deadline: 'Sun, 01 Jan 2023')
    expect(task).to be_valid
  end

  it "is invalid without a title" do
    task = Task.new(title: nil)
    expect(task.valid?).to eq(false)
  end

  it "is invalid without a deadline" do
    task = Task.new(deadline: nil)
    expect(task.valid?).to eq(false)
  end
end