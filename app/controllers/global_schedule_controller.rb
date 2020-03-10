class GlobalScheduleController < ApplicationController
    before_action :schedule_item_params, only: [:update]
    before_action :set_schedule_item, only: [:update]

    def index
        @schedule_items = ScheduleItem.where(is_global: true)
    end

    def create
        @schedule_item = ScheduleItem.new(schedule_item_params)
        respond_to do |format|
            if @schedule_item.save
                format.html { redirect_to :index, notice: 'Schedule item was successfully created.' }
            else
                format.html { render :index }
            end
        end
    end

    def update
        respond_to do |format|
            if @schedule_item.update(schedule_item_params)
                format.html { redirect_to :index, notice: 'Schedule item was successfully created.' }
            else
                format.html { render :new }
            end
        end
    end

    private
    # Only allow a list of trusted parameters through.
    def schedule_item_params
      params.require(:schedule_item).permit(:event_date, :starts_at_time, :ends_at_time, :name, :location, :meeting_link)
    end
end
