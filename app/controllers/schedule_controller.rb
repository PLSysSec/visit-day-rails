class ScheduleController < ApplicationController
    def all
        @groups = Student.distinct.pluck(:group)
    end

    def group
        @group = params.require(:group_name)
        @students = Student.find_by group: @group
        @groups = Group.all
    end
end