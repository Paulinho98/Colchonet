class Room < ApplicationRecord
    attr_accessor :description, :location, :title

    def complete_name
        "#{title}, #{location}"
    end

end
