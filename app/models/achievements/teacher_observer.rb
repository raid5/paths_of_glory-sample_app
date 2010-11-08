class TeacherObserver < ActiveRecord::Observer
  observe :post
  
  def after_save(post)
    Teacher.award_achievements_for(post.user) unless post.new_record?
  end
end