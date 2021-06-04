class User < ApplicationRecord
    has_many :expenses
    validates :username, presence: true, uniqueness: true, length: { minimum: 4,
                                                               too_short: 'username can be minimum of 4 characters long.' }
end
