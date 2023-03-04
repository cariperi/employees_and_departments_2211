require 'spec_helper'

describe Department do
  before(:each) do
    @customer_service = Department.new("Customer Service")
    @bobbi = Employee.new({name: "Bobbi Jaeger", age: "30", salary: "100000"})
    @aaron = Employee.new({name: "Aaron Tanaka", age: "25", salary: "90000"})
  end

  describe '#initialize' do
    it 'exists' do
      expect(@customer_service).to be_a Department
    end

    it 'has a name' do
      expect(@customer_service.name).to eq('Customer Service')
    end

    it 'has employees that starts as empty by default' do
      expect(@customer_service.employees).to eq([])
    end

    it 'has expenses that start at zero by default' do
      expect(@customer_service.expenses).to eq(0)
    end
  end

  describe '#hire' do
    it 'can add employee objects to the department' do
      expect(@customer_service.employees).to eq([])

      @customer_service.hire(@bobbi)
      @customer_service.hire(@aaron)

      expect(@customer_service.employees).to eq([@bobbi, @aaron])
      expect(@customer_service.employees.count).to eq(2)
      expect(@customer_service.employees[0]).to be_a Employee
    end
  end

  describe '#expense' do
    it 'can track department expenses' do
      expect(@customer_service.expenses).to eq(0)

      @customer_service.expense(100)
      @customer_service.expense(25)

      expect(@customer_service.expenses).to eq(125)
    end
  end
end
