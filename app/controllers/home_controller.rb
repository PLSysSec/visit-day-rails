class HomeController < ApplicationController
  def schedules
    @people = Person.all
    @kinds = Person.kinds.keys
  end

  def welcome
  end

  def student_panel
  end
end
