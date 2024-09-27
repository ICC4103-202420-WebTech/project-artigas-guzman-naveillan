# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


Enrollment.destroy_all
Lesson.destroy_all
Course.destroy_all
User.destroy_all

teacher1 = User.create!(name: "John Teacher", email: "john.teacher@example.com", role: "teacher")
teacher2 = User.create!(name: "Jane Teacher", email: "jane.teacher@example.com", role: "teacher")

student1 = User.create!(name: "Student One", email: "student1@example.com", role: "student")
student2 = User.create!(name: "Student Two", email: "student2@example.com", role: "student")
student3 = User.create!(name: "Student Three", email: "student3@example.com", role: "student")
student4 = User.create!(name: "Student Four", email: "student4@example.com", role: "student")
student5 = User.create!(name: "Student Five", email: "student5@example.com", role: "student")


course1 = Course.create!(title: "Ruby Basics", description: "Learn the basics of Ruby", teacher: teacher1)
course2 = Course.create!(title: "Advanced Ruby", description: "Deep dive into Ruby", teacher: teacher1)
course3 = Course.create!(title: "Rails for Beginners", description: "Introduction to Rails", teacher: teacher2)
course4 = Course.create!(title: "Advanced Rails", description: "Building complex apps with Rails", teacher: teacher2)


4.times do |i|
  Lesson.create!(title: "Lesson #{i+1} of Ruby Basics", content: "Content of lesson #{i+1}", lesson_type: "text", course: course1)
  Lesson.create!(title: "Lesson #{i+1} of Advanced Ruby", content: "Content of lesson #{i+1}", lesson_type: "video", course: course2)
  Lesson.create!(title: "Lesson #{i+1} of Rails for Beginners", content: "Content of lesson #{i+1}", lesson_type: "text", course: course3)
  Lesson.create!(title: "Lesson #{i+1} of Advanced Rails", content: "Content of lesson #{i+1}", lesson_type: "video", course: course4)
end


[student1, student2, student3, student4, student5].each do |student|
  Enrollment.create!(user: student, course: course1, progress: rand(10..100))
  Enrollment.create!(user: student, course: course2, progress: rand(10..100))
  Enrollment.create!(user: student, course: course3, progress: rand(10..100))
  Enrollment.create!(user: student, course: course4, progress: rand(10..100))
end

puts "Seeding completed successfully!"
