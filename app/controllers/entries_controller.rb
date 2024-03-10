class EntriesController < ApplicationController

  def new
    @entry = Entry.new

  end

  # POST /entries
  def create
    @entry = Entry.new(entry_params) # using strong parameters
    if @entry.save
      redirect_to place_path(@entry.place_id), notice: 'Entry was successfully created.'
    else
      render :new
    end
  end

  private

  def entry_params
    params.require(:entry).permit(:title, :description, :occurred_on, :place_id, :uploaded_image)
  end
end