require 'spec_helper'

describe Division do
  before(:each) do
    @division = Division.new("Corporate")
    @customer_service = Department.new("Customer Service")
    @parks = Department.new("Parks")
    @bobbi = Employee.new({name: "Bobbi Jaeger", age: "30", salary: "100000"})
    @aaron = Employee.new({name: "Aaron Tanaka", age: "25", salary: "90000"})
    @james = Employee.new({name: "James Doe", age: "28", salary: "80000"})
  end

  describe '#initialize' do
    it 'exists' do
      expect(@division).to be_a Division
    end

    it 'has a name' do
      expect(@division.name).to eq("Corporate")
    end

    it 'has departments that starts as empty by default' do
      expect(@division.departments).to eq([])
    end
  end

  describe '#add_department' do
    it 'can add department objects to a division' do
      expect(@division.departments).to eq([])

      @division.add_department(@customer_service)
      @division.add_department(@parks)

      expect(@division.departments).to eq([@customer_service, @parks])
      expect(@division.departments[0]).to be_a Department
    end
  end
end
