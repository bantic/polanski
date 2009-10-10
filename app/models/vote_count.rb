class VoteCount < ActiveRecord::Base
  def self.roman_polanski
    VoteCount.first(:conditions => {:name => "Roman Polanski"})
  end
  
  def jail_him
    positive
  end
  
  def free_him
    negative
  end
end
