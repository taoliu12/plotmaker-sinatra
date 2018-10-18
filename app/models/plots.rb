class Plot < ActiveRecord::Base
    belongs_to :user
    validates :title, presence: :true
    validates :setting, presence: :true
    validates :hero, presence: :true
    validates :enemy, presence: :true
    validates :conflict, presence: :true
    validates :climax, presence: :true
    validates :resolution, presence: :true
end
