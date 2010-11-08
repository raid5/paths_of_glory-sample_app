class LoudMouth < Achievement
  
  level 1, :quota => 2
  level 2, :quota => 5
  level 3, :quota => 9
  # level 4, :quota => 100
  # level 5, :quota => 500
  
  set_thing_to_check { |user| user.comments.count }

  # Comment out below for multi-level achievements
  def self.award_achievements_for(user)
    return unless user
    levels.each do |level|
      if !user.has_achievement?(self, level[:level]) and thing_to_check(user) >= level[:quota]
        user.award_achievement(self, level[:level])
      end
    end
  end

  # Comment out below for once-off achievements
  # def self.award_achievements_for(user)
  #   return unless user
  #   return if user.has_achievement?(self)
  #   user.award_achievement(self)
  # end
  
  # Change to reflect the purpose of this achievement.
  def self.description
    'Comment a lot and earn this sweet achievement.'
  end
  
  # Change the image to use for the achievement.
  #  Be sure to include this file in Rails.root/public/images
  def self.image
    'rss.png'
  end
  
end