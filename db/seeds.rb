# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create(name: "supervisor", email: "supervisor@example.com", 
  password: "foobar", password_confirmation: "foobar", supervisor: 1)
User.create(name: "supervisor1", email: "supervisor1@example.com", 
  password: "foobar", password_confirmation: "foobar", supervisor: 1)

(1..30).each do |i| 
  User.create(name: "User#{i}", email: "user#{i}@example.com", 
  password: "foobar", password_confirmation: "foobar", supervisor: 0)
end

course_list = {
  "Internship" => "This is a course for Internship",
  "Trainee" => "This is a course for Trainee"
}

course_list.each do |name, description|
  course = Course.create(name: name, description: description)
  User.find_by(email: "supervisor@example.com").supervisor_courses.create course_id: course.id
end

course_subject_list=[[1,1],[1,2],[1,3],[1,4]]
course_subject_list.each do |course_id,subject_id|
  CourseSubject.create( course_id: course_id, subject_id: subject_id)
end

subject_list = {
  "Rails" => "Learn about rails",
  "Git" => "Learn about git",
  "MySQL" => "Learn about MySQL",
  "POSGRESQL" => "Learn about POSGRESQL",
  "iOS" => "Learn about iOS",
  "AdvancedGit" => "Learn about advanced git"
}

subject_list.each do |name, description|
  Subject.create(name: name, description: description)
end

  (1..6).each do |i|
    Task.create(subject_id: i, content: "Chapter ##{i}")
  end

