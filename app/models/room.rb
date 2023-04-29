class Room < ApplicationRecord
    belongs_to :user

    attr_accessor :description, :location, :title

    def complete_name
        "#{title}, #{location}"
    end

end
