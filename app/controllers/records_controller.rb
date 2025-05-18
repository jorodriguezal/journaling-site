class RecordsController < ApplicationController
  def index
    @records = Record.all # Fetch all records from the database
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

  private
  def record_params # This method is used to whitelist the parameters that are allowed to be submitted through the form
    params.require(:record).permit(:date, :body, :mood)
  end
end
