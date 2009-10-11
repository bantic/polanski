class Vote < ActiveRecord::Base
  after_create :increment_vote_count
  
  # validate_on_create :not_a_double_vote
  
  private
  
  def not_a_double_vote
    if Vote.exists?(["ip = ? AND created_at > ?", self.ip, 2.hours.ago])
      errors.add_to_base("Already voted from ip #{self.ip} recently.")
      return false
    else
      return true
    end
  end
  
  def increment_vote_count
    if self.positive
      VoteCount.roman_polanski.increment!(:positive)
    else
      VoteCount.roman_polanski.increment!(:negative)
    end
  end
end
