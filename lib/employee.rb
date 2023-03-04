class Employee
  attr_reader :name,
              :age,
              :salary

  def initialize(details)
    @name = details[:name]
    @age = details[:age].to_i
    @salary = details[:salary].delete("$").to_i
  end
end
