class ScheduleItemsController < ApplicationController
  before_action :get_person
  before_action :set_schedule_item, only: [:show, :edit, :update, :destroy, :remove_attendee, :add_attendee]
  before_action :schedule_item_params, only: [:create, :update]

  # GET /schedule_items
  # GET /schedule_items.json
  def index
    logger.warn Rails.configuration.x.days
    @schedule_items = ScheduleItem.includes(:people).where('people.id' => @person.id).order(starts_at: :asc)
    @all_people = Person.all
  end

  def add_attendee
    logger.warn "Adding attendee!"
    logger.warn Person.find(params.require(:attendee_id))
    @schedule_item.people << Person.find(params.require(:attendee_id))
    @schedule_item.save
    respond_to do |format|
      format.html { redirect_to person_schedule_items_url(@person)}
    end
  end
  
  def remove_attendee
    @schedule_item.people.delete(params.require(:attendee_id))
    @schedule_item.save
    respond_to do |format|
      format.html { redirect_to person_schedule_items_url(@person)}
    end
  end

  # GET /schedule_items/1
  # GET /schedule_items/1.json
  def show
  end

  # GET /schedule_items/new
  def new
    @schedule_item = ScheduleItem.new
  end

  # GET /schedule_items/1/edit
  def edit
  end

  # POST /schedule_items
  # POST /schedule_items.json
  def create
    @schedule_item = ScheduleItem.new(schedule_item_params)
    @schedule_item.people << @person
    respond_to do |format|
      if @schedule_item.save
        format.html { redirect_to person_schedule_items_url(@person), notice: 'Schedule item was successfully created.' }
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
    logger.warn schedule_item_params
    respond_to do |format|
      if @schedule_item.update(schedule_item_params)
        logger.warn @schedule_item.inspect
        format.html { redirect_to person_schedule_items_url(@person), notice: 'Schedule item was successfully updated.' }
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
      format.html { redirect_to person_schedule_items_url(@person), notice: 'Schedule item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_schedule_item
      @schedule_item = ScheduleItem.find(params[:schedule_item_id] || params[:id])
    end

    # Only allow a list of trusted parameters through.
    def schedule_item_params
      params.require(:schedule_item).permit(:event_date, :with_person, :starts_at_time, :ends_at_time, :name, :location)
    end

    def get_person
      @person = Person.find(params[:person_id])
    end
end
