class Division
  attr_reader :name,
              :departments

  def initialize(name)
    @name = name
    @departments = []
  end

  def add_department(department)
    @departments << department
  end

  def departments_with_multiple_employees
    @departments.select{|department| department.employees.count > 1}
  end
end
