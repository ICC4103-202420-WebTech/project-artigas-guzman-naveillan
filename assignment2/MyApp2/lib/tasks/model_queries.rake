namespace :db do

    task :model_queries => :environment do
  
      # Query 0: Sample query; show all the users
      puts "Query 0: Sample query; show all the users"
      result = User.all
      puts result.map(&:name)
      puts "EOQ" # End Of Query
  
      # Query 1: Name of the student with the most enrolled courses
      puts "Query 1: Name of the student with the most enrolled courses"
      student = User.joins(:enrollments).where(role: 'student').group('users.id').order('COUNT(enrollments.id) DESC').limit(1).pluck(:name)
      puts student
      puts "EOQ"
  
      # Query 2: Show the course that has the most lessons
      puts "Query 2: Course that has the most lessons"
      course = Course.joins(:lessons).group('courses.id').order('COUNT(lessons.id) DESC').limit(1).pluck(:title)
      puts course
      puts "EOQ"
  
      # Query 3: Name of the course creator that has created the most courses
      puts "Query 3: Course creator with the most courses"
      creator = User.joins(:courses).where(role: 'teacher').group('users.id').order('COUNT(courses.id) DESC').limit(1).pluck(:name)
      puts creator
      puts "EOQ"
  
      # Query 4: Show the last 3 created courses
      puts "Query 4: Last 3 created courses"
      last_courses = Course.order(created_at: :desc).limit(3).pluck(:title)
      puts last_courses
      puts "EOQ"
  
      # Query 5: Full name of the student who has the most progress on a course
      puts "Query 5: Student with the most progress in a course"
      top_student = Enrollment.joins(:user).where(users: {role: 'student'}).order('enrollments.progress DESC').limit(1).pluck('users.name')
      puts top_student
      puts "EOQ"
  
      # Query 6: Show the title of the course that has the most current students
      puts "Query 6: Course with the most current students"
      popular_course = Course.joins(:enrollments).group('courses.id').order('COUNT(enrollments.id) DESC').limit(1).pluck(:title)
      puts popular_course
      puts "EOQ"
  
      # Query 7: Show the title and number of lessons of the course that has been completed most times
      puts "Query 7: Course with the most completions"
      completed_course = Course.joins(:enrollments).group('courses.id').order('COUNT(CASE WHEN enrollments.progress = 100 THEN 1 END) DESC').limit(1).pluck(:title, 'COUNT(lessons.id)')
      puts completed_course
      puts "EOQ"
  
    end
  
  end
  