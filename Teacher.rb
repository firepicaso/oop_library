require_relative 'person'

class Teacher < Person
    def initialize(id, age, name = 'Unknown', parent_permission: true, specialization)
        super(id, name, age, parent_permission)
        @specialization = specialization
    end

    def can_use_services?
        true
    end

end
