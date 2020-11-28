require 'pry'

class Actor < ActiveRecord::Base
    has_many :characters
    has_many :shows, through: :characters

    def full_name
        "#{self.first_name} #{self.last_name}"
    end

    def list_roles
        #lists all of the characters that actor has
        #alongside the show that the character is in
        #ie peter.list_roles 
        #=> ["tyrion lannister - game of thrones", "some other character/show"]
        self.characters.collect do |x|
            "#{x.name} - #{x.show.name}"
        end
    end
end