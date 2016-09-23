#

class Person
 def initialize(name)
  @name=name
  @age=0
 end
 def to_s
  puts "#{@name} is #{@age} years old"
  if (14..17).include?(@age)
  	puts "#{@name} is a teenager"
  end
  if (18..80).include?(@age)
  	puts "#{@name} is an adult"
  end
 end
 def increment_age
  @age=@age+1
 end
end

my_person=Person.new('John')
my_person.to_s
for i in 0..19
 my_person.increment_age
end
my_person.to_s
