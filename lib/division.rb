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

  def list_all_employee_names
    names = []
    @departments.each do |department|
      department.employees.each do |employee|
        names << employee.name
      end
    end
    names
  end
end
