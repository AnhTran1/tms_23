# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create(name: "supervisor", email: "supervisor@example.com", 
  password: "foobar", password_confirmation: "foobar", supervisor: 1)

(1..30).each do |i| 
  User.create(name: "User#{i}", email: "user#{i}@example.com", 
  password: "foobar", password_confirmation: "foobar", supervisor: 0)
end

course_list=[["Course K5434T", "The MySQL development project has made its source code available under the terms of the GNU General Public License, as well as under a variety of proprietary agreements. MySQL was owned and sponsored by a single for-profit firm, the Swedish company MySQL AB, now owned by Oracle Corporation"]]
course_list.each do |course_name, description|
  Course.create( name: course_name, description: description )
end