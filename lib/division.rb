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
end
