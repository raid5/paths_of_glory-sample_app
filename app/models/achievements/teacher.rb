class Teacher < Achievement
  
  level 1, :quota => 2
  level 2, :quota => 4
  level 3, :quota => 6
  level 4, :quota => 8
  level 5, :quota => 20
  
  set_thing_to_check { |user| user.posts.count }

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
    'Post a bunch, and earn this.'
  end
  
  # Change the image to use for the achievement.
  #  Be sure to include this file in Rails.root/public/images
  def self.image
    'achievement-default.png'
  end
  
end