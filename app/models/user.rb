class User < ActiveRecord::Base
 has_many :posts, dependent: :destroy
  validates :name, presence: true,
                    length: { minimum: 1 }
end
