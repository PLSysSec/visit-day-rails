module PeopleHelper
    def kind_select
        Person.gender_types.map do |k,v|
          [Person.human_enum_name(:kinds, k), v]
        end
    end
end
