class Department
  attr_reader :name,
              :employees,
              :expenses,
              :expenses_by_employee

  def initialize(name)
    @name = name
    @employees = []
    @expenses = 0
    @expenses_by_employee = Hash.new(0)
  end

  def hire(employee)
    @employees << employee
  end

  def expense(amount, employee)
    @expenses_by_employee[employee] += amount
    @expenses += amount
  end
end
