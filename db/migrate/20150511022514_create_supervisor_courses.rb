class CreateSupervisorCourses < ActiveRecord::Migration
  def change
    create_table :supervisor_courses do |t|
    	t.integer :user_id
    	t.integer :course_id
    	t.datetime :start_at

      t.timestamps null: false
    end
  end
end
