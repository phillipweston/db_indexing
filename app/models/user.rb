class User < ActiveRecord::Base
  has_many :karma_points

  attr_accessible :first_name, :last_name, :email, :username, :total_karma

  validates :first_name, :presence => true
  validates :last_name, :presence => true

  validates :username,
            :presence => true,
            :length => {:minimum => 2, :maximum => 32},
            :format => {:with => /^\w+$/},
            :uniqueness => {:case_sensitive => false}

  validates :email,
            :presence => true,
            :format => {:with => /^[\w+\-.]+@[a-z\d\-.]+\.[a-z]+$/i},
            :uniqueness => {:case_sensitive => false}

  def self.by_karma
    self.order('total_karma DESC')
  end
 

  # def self.page(num = 1)
  #   per_page = 50
  #   offset = (num * per_page) - per_page

  #   self.by_karma.limit(per_page).offset(offset)
  # end

  def get_total_karma
    self.karma_points.sum(:value)
  end

  def full_name
    "#{first_name} #{last_name}"
  end
end
