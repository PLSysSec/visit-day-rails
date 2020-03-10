class ScheduleItemsController < ApplicationController
  before_action :get_person, only: [:for_person]
  before_action :get_author, only: [:create, :destroy, :update, :add_attendee, :remove_attendee]
  before_action :set_schedule_item, only: [:show, :edit, :update, :destroy, :remove_attendee, :add_attendee]
  before_action :schedule_item_params, only: [:create, :update]

  def global
    @schedule_item = ScheduleItem.new(is_global: true)
    @schedule_items = ScheduleItem.where(is_global: true)
  end

  def for_person
    @schedule_item = ScheduleItem.new
    @schedule_items = @person.schedule_items
    @all_people = Person.where.not(kind: :research_group)
    conflicts = @person.schedule_conflicts
    if conflicts.count > 0
      flash[:alert] = ""
      for p in conflicts
        if !flash.now[:alert].empty?
          flash.now[:alert] += "<br/>"
        end
        flash.now[:alert] += helpers.conflict_text(@person, p[0], p[1])
      end
    end
    @conflicts = conflicts.flatten
    @group_meetings = ScheduleItem.group_events
  end

  def add_attendee
    @schedule_item.people << Person.find(params.require(:attendee_id))
    @schedule_item.save
    respond_to do |format|
      format.html { redirect_to redirect_url}
    end
  end
  
  def remove_attendee
    @schedule_item.people.delete(params.require(:attendee_id))
    @schedule_item.save
    respond_to do |format|
      format.html { redirect_to redirect_url}
    end
  end

  # GET /schedule_items/new
  def new
    @schedule_item = ScheduleItem.new
  end

  # POST /schedule_items
  # POST /schedule_items.json
  def create
    @schedule_item = ScheduleItem.new(schedule_item_params)
    if !@author.nil? && schedule_item_params[:with_person].to_i != @author.id
      @schedule_item.people << @author
    end
    respond_to do |format|
      if @schedule_item.save
        format.html { redirect_to redirect_url, notice: 'Schedule item was successfully created.' }
        format.json { render :show, status: :created, location: @schedule_item }
      else
        format.html { render :new }
        format.json { render json: @schedule_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /schedule_items/1
  # PATCH/PUT /schedule_items/1.json
  def update
    respond_to do |format|
      if @schedule_item.update(schedule_item_params)
        format.html { redirect_to redirect_url, notice: 'Schedule item was successfully updated.' }
        format.json { render :show, status: :ok, location: @schedule_item }
      else
        format.html { render :edit }
        format.json { render json: @schedule_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /schedule_items/1
  # DELETE /schedule_items/1.json
  def destroy
    @schedule_item.destroy!
    respond_to do |format|
      format.html { redirect_to redirect_url, notice: 'Schedule item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def redirect_url
      if !@author.nil?
        person_schedule_url(person_id: @author)
      else
        global_schedule_url
      end
    end

    def get_author
      maybe_author = params.permit(:author_id)[:author_id]
      @author = maybe_author.nil? ? nil : Person.find(maybe_author)
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_schedule_item
      @schedule_item = ScheduleItem.find(params[:schedule_item_id] || params[:id])
    end

    # Only allow a list of trusted parameters through.
    def schedule_item_params
      params.require(:schedule_item).permit(:event_date, :with_person, :starts_at_time, :ends_at_time, :name, :location, :is_global, :meeting_link)
    end

    def get_person
      @person = Person.find(params[:person_id])
    end
end
