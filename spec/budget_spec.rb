require 'spec_helper'

describe Budget do
  before(:each) do
    @budget = Budget.new('2023')
    @customer_service = Department.new("Customer Service")
    @parks = Department.new('Parks')
    @bobbi = Employee.new({name: "Bobbi Jaeger", age: "30", salary: "100000"})
    @aaron = Employee.new({name: "Aaron Tanaka", age: "25", salary: "90000"})
  end

  describe 'initialize' do
    it 'exists' do
      expect(@budget).to be_a Budget
    end

    it 'has a year' do
      expect(@budget.year).to eq('2023')
    end

    it 'has departments that are empty by default' do
      expect(@budget.departments).to eq([])
    end
  end
end
