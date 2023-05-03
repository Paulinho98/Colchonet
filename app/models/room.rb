class Room < ApplicationRecord
    has_many :reviews, :dependent => :destroy
    belongs_to :user

    attr_accessor :description, :location, :title

    def complete_name
        "#{title}, #{location}"
    end

end
