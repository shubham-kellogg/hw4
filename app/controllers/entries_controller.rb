class EntriesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  
  def index
    @entries = current_user.entries.order('created_at DESC')
  end
  end

  # POST /entries
  def create
    @entry = current_user.entries.build(entry_params)
  
    if @entry.save
      # Redirect to the entry show page or index with success message
      redirect_to @entry, notice: 'Entry was successfully created.'
    else
      render :new
    end
  end
  
  private
  
  def entry_params
    params.require(:entry).permit(:title, :description, :occurred_on, :image) # Adjust attributes as necessary
  end