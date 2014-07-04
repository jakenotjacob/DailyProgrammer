#!/usr/bin/env ruby
#
student_list = File.open("input.txt", "r+")

students = student_list.read
students = students.delete! ","
students = students.split("\n")

def get_score(grades)
  grades.map!{|grade| grade.to_i}
  avg = grades.inject(:+)/grades.length
  letter_grade = get_letter(avg)
  unless letter_grade == "F"
    letter_end = get_sym(avg) 
  end
  return [avg, "#{letter_grade}#{letter_end}"]
end

def get_letter(avg)
  case avg
  when 90..100
    "A"
  when 80..89
    "B"
  when 70..79
    "C"
  when 60..69
    "D"
  when 0..59
    "F"
  end
end

def get_sym(avg)
  num = avg.to_s[1].to_i
  if num <= 3
    "-"
  elsif num >=6
    "+"
  else
    nil
  end
end

final_grades = []

Student = Struct.new(:name, :last_name, :score, :letter, :grades)
students.each {|student|
  grades = []
  first_name, last_name, *grades = student.split(" ")
  avg, letter = get_score(grades)
  s = Student.new(first_name, last_name, avg, letter, grades)
  final_grades << s
}

final_grades.sort_by!{|student|
  student[:score]
}

final_grades.each {|s|
  puts "#{s[:name]} #{s[:last_name]} (#{s[:score]}%) (#{s[:letter]}) #{s[:grades].join(" ")}"
}
