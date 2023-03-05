class Budget
  attr_reader :year,
              :departments

  def initialize(year)
    @year = year
    @departments = []
  end

  def add_department(department)
    @departments << department
  end

  def departments_with_low_expenses
    @departments.select{|department| department.expenses < 500}
  end

  def get_salaries
    salaries = {}
    @departments.each do |department|
      department.employees.each do |employee|
        salaries[employee.name] = employee.salary
      end
    end
    salaries
  end
end
