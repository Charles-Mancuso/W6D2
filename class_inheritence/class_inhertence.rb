class Employee

    attr_reader :name, :title, :salary, :boss
    def initialize(name, title, salary, boss)
        @name = name
        @title = title
        @salary = salary
        @boss = boss
    end

    def bonus(multiplier)
        bonus = self.salary * multiplier
    end
end

class Manager < Employee
    
    attr_accessor :employees
    def initialize(name, title, salary, boss, employees = [])
        super(name, title, salary, boss)
        @employees = employees
    end

    def bonus(multiplier)
        sum = 0
        employees.each do |employee|
            sum += employee.salary
        end
        bonus = sum * multiplier
    end
end

ned = Manager.new("Ned", "Founder", 1000000, nil)
darren = Manager.new("Darren", "TA Manger", 78000, ned)
shawna = Employee.new("Shawna", "TA", 12000, darren)
david = Employee.new("David", "TA", 10000, darren)

ned.employees = [darren, shawna, david]
darren.employees = [shawna, david]

p ned.bonus(5)
p darren.bonus(4)
p david.bonus(3)