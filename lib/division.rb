class Division
  attr_reader :name,
              :departments

  def initialize(name)
    @name = name
    @departments = []
  end
end
