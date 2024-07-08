# class CheckName < ActiveModel::Validator
#     def validate(record)
#         if record.name == "rishabh"
#             record.errors.add :base, "This person is not Available"
#         end
#     end
# end
class Employee < ApplicationRecord

    # before_create MyNameCheck
    
    # before_create -> { puts "congratulations "}

    # after_touch do |employee|
    #     puts "You have touched the object"
    # end
    
    # validates :position, comparison: { other_than: :"cricketer"}
    # validates :position, format: { with: /\A+\Z/, message: "only allowed letters are from a to z" }
    
       # validates :name, length: { minimum: 2 }
    # validates :email, uniqueness: true
    # validates :position, length: { in: 5..8}
    # validates_with CheckName
    

      #this method or call back asign the positions value to name if the name is blank
    # before_validation :ensure_name_has_value
    # private
    # def ensure_name_has_value
    #     if name.blank?
    #         self.name = position unless position.blank?
    #     end
    # end
    
        #before_create do
    # before_create do
    #     self.position = name.capitalize if position.blank?
    # end

    #  after_initialize do
    #     puts "object is initialized"
    #  end

    # after_find do |employee|
    #     puts "you have found the object"
    # end
    
    # before_create :name, if: :is_valid_name?

    private
    def is_valid_name?
        puts "method is running before initializing"
        return false
    end
end

class MyNameCheck
    def self.before_create(record)
        if record.position.blank?
            record.position = record.name.capitalize
        end
    end
end
