#

class Person
 def initialize(name)
  @name=name
  @age=0
 end
 def to_s
  puts "#{@name} is #{@age} years old"
 end
end

my_person=Person.new('John')
my_person.to_s

