class LoudMouthObserver < ActiveRecord::Observer
  observe :comment
  
  def after_save(comment)
    LoudMouth.award_achievements_for(comment.user) unless comment.new_record?
  end
end