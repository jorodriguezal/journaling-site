class RecordsController < ApplicationController
  before_action :get_records

  def index
  end

  def new # New is the action that renders the form for creating a new record
    @record = Record.new
  end

  def create # Create is the action that handles the form submission
    @record = Record.new(record_params)
    @record.date = DateTime.now # Set the date to the current date and time
    if @record.save
      redirect_to records_path, notice: "Record was successfully created."
    else
      render :new
    end
  end

  def get_records # This method is used to fetch records from the database
    @records = Record.all # Fetch all records from the database
    @has_today_record = is_today?
  end

  def is_today?
    return @records.select { |record| record.date&.strftime("%d/%m/%Y") == DateTime.now.strftime("%d/%m/%Y") }
  end

  private
  def record_params # This method is used to whitelist the parameters that are allowed to be submitted through the form
    params.require(:record).permit(:date, :body, :mood)
  end
end
