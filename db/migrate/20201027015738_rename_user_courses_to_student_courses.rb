class RenameUserCoursesToStudentCourses < ActiveRecord::Migration[5.2]
  def change
    rename_table :user_courses, :student_courses
  end
end
