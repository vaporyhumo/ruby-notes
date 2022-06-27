def run(string)
  print string
  arrow eval(string)
end

def arrow(arg)
  print "=> "
  p arg
end

# In Ruby **EVERYTHING** is an object, with no exeptions
# Every object has a class, with no exeptions
# Every object has a singleton class, with no exeptions

# -- Class

# to ask an objects class we use the (instance)method #class

puts "===== Class"
puts

run 'BasicObject.class'
run 'Object.class'
run 'Class.class'
run '1.class'
run '"1".class'
run '[].class'
run '{}.class'
run ':name.class'

# We cannot do `puts BasicObject.new` nor `p BasicObject.new` because
# BasicObject does not implement either `#to_s` or `#inspect`

# Every class has a parent class or superclass, but BasicObject

# -- Superclass

puts
puts "===== Superclass"
puts

puts "BasicObject.superclass"
arrow BasicObject.superclass

puts "Object.superclass"
arrow Object.superclass

puts "String.superclass"
arrow String.superclass
puts "Integer.superclass"
arrow Integer.superclass
puts "Numeric.superclass"
arrow Numeric.superclass
puts "Array.superclass"
arrow Array.superclass
puts "Hash.superclass"
arrow Hash.superclass
puts "Class.superclass"
arrow Class.superclass
puts "Module.superclass"
arrow Module.superclass

run "1 + 1"
