require 'spec_helper'

describe Budget do
  before(:each) do
    @budget = Budget.new('2023')
    @customer_service = Department.new("Customer Service")
    @parks = Department.new('Parks')
    @bobbi = Employee.new({name: "Bobbi Jaeger", age: "30", salary: "100000"})
    @aaron = Employee.new({name: "Aaron Tanaka", age: "25", salary: "90000"})
    @john = Employee.new({name: "John Doe", age: "32", salary: "80000"})
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

  describe '#add_department' do
    it 'can add departments to the budget' do
      expect(@budget.departments).to eq([])

      @budget.add_department(@customer_service)
      @budget.add_department(@parks)

      expect(@budget.departments).to eq([@customer_service, @parks])
      expect(@budget.departments.count).to eq(2)
      expect(@budget.departments[0]).to be_a Department
    end
  end

  describe '#departments_with_low_expenses' do
    it 'can list departments with expenses less than $500' do
      @budget.add_department(@customer_service)
      @budget.add_department(@parks)

      @customer_service.expense(300)
      @customer_service.expense(400)
      @parks.expense(250)

      expect(@customer_service.expenses).to eq(700)
      expect(@parks.expenses).to eq(250)
      expect(@budget.departments_with_low_expenses).to eq([@parks])
    end
  end

  describe '#get_salaries' do
    it 'can list the salaries of all of its employees' do
      @budget.add_department(@customer_service)
      @budget.add_department(@parks)

      @customer_service.hire(@bobbi)
      @parks.hire(@aaron)
      @parks.hire(@john)

      expect(@budget.get_salaries).to be_a Hash
      expect(@budget.get_salaries.keys).to eq(['Bobbi Jaeger', 'Aaron Tanaka', 'John Doe'])
      expect(@budget.get_salaries.values).to eq([100000, 90000, 80000])
      expect(@budget.get_salaries['Bobbi Jaeger']).to eq(100000)
      expect(@budget.get_salaries['Aaron Tanaka']).to eq(90000)
      expect(@budget.get_salaries['John Doe']).to eq(80000)
    end
  end
end
