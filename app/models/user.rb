class User < ActiveRecord::Base
 has_and_belongs_to_many :groups
 has_many :posts, dependent: :destroy
  validates :name, presence: true,
                    length: { minimum: 1 }
end
