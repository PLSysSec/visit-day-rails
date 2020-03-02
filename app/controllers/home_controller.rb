class HomeController < ApplicationController
  def index
    @people = Person.all
    @kinds = Person.kinds.keys
  end
end
